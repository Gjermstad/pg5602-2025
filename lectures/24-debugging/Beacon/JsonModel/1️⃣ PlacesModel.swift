//
//  PlaceModel.swift
//  Beacon
//

import SwiftUI
import Combine
import MapKit

//
// PlacesModel håndterer søk etter steder via Geoapify API.
// Klassen er @MainActor fordi den oppdaterer UI-relatert state (@Published properties).
//
@MainActor final class PlacesModel: ObservableObject
{
  // Representerer kartets nåværende kamerastilling med både senter og zoom-nivå
  @Published var position: MapCameraPosition = .farsund

  // Valgt kategori for søket (f.eks. hotell, restaurant)
  @Published var category: Category = .hotel

  // Melding til brukeren (suksess eller feilmelding)
  @Published var message: String?

  // Liste over steder hentet fra Geoapify API
  @Published var places: [PlacesFeature] = []

  @Published var isLoading = false

  //
  // Henter steder fra Geoapify API basert på gitte parametere.
  // Ved feil settes en beskrivende feilmelding i "message".
  //
  func fetchPlaces(category: Category = .hotel, radius: Double = 10_000, limit: Int = 10) async
  {
    self.category = category
    
    // Start spinner/indikator for lasting
    isLoading = true

    // Sørger for at spinneren alltid stoppes når funksjonen avsluttes,
    // uansett om den fullføres normalt eller kaster en feil
    defer { isLoading = false }

    let longitude = position.region?.center.longitude ?? defaultLongitude // Se Global for defaultLongitude
    let latitude = position.region?.center.latitude ?? defaultLatitude    // Se Global for defaultLatitude

    // Bygger URL for Geoapify Places API
    var address = URLComponents(string: "https://api.geoapify.com/v2/places")!
    
    // Legger til søkeparametere som query items
    var queries = [URLQueryItem]()
    queries.append(URLQueryItem(name: "categories", value: category.value))
    queries.append(URLQueryItem(name: "filter", value: "circle:\(longitude),\(latitude),\(radius)"))
    queries.append(URLQueryItem(name: "limit", value: "\(limit)"))
    queries.append(URLQueryItem(name: "apiKey", value: "\(Bundle.main.apiKey)"))
    address.queryItems = queries
    
    // Validerer at URL-en er gyldig før API-kall
    guard let url = address.url else
    {
      message = "⚠️ Ugyldig URL – sjekk parametrene."
      return
    }
    
    do
    {
      // Utfører asynkront nettverkskall til Geoapify
      let (data, http) = try await URLSession.shared.data(from: url)
      
      // Verifiserer at responsen er HTTP
      guard let httpResponse = http as? HTTPURLResponse else
      {
        throw URLError(.badServerResponse)
      }
      
      // Sjekker at statuskoden indikerer suksess (200-299)
      guard (200...299).contains(httpResponse.statusCode) else
      {
        throw URLError(.badServerResponse)
      }
      
      // Dekoder JSON-responsen til Swift-strukturer
      let decoder = JSONDecoder()
      let response = try decoder.decode(PlacesResponse.self, from: data)
      
      // Oppdaterer state med nye data
      places = response.features ?? []
      message = response.type == "FeatureCollection" ? "🛜 Nedlasting vellykket" : "⚠️ Uventet svar fra Geoapify"

      // Beregner og setter optimal kartregion for alle stedene
      zoomToFit()
    }
    catch
    {
      // Håndterer feil ved nettverkskall eller dekoding
      message = """
      ⚠️ Feil ved henting fra Geoapify: \(error.localizedDescription)
      🫵 Kontroller internettforbindelsen og prøv igjen.
      """
    }
  }
  
  //
  // Funksjon som beregner region som dekker alle steder
  //
  func zoomToFit()
  {
    guard !places.isEmpty else { return }

    let minLat = places.map { $0.properties.lat }.min()!
    let maxLat = places.map { $0.properties.lat }.max()!
    let minLon = places.map { $0.properties.lon }.min()!
    let maxLon = places.map { $0.properties.lon }.max()!

    let center = CLLocationCoordinate2D(
      latitude: (minLat + maxLat) / 2,
      longitude: (minLon + maxLon) / 2
    )

    let span = MKCoordinateSpan(
      latitudeDelta: (maxLat - minLat) * 1.25,
      longitudeDelta: (maxLon - minLon) * 1.25
    )

    // Oppdaterer kartets posisjon
    position = .region(MKCoordinateRegion(center: center, span: span))
  }
}
