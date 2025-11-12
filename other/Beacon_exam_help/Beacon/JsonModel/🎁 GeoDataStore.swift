//
//  GeoDataStore.swift
//  Beacon
//
//  Created by Stig Højklint on 26/10/2025.
//

import SwiftUI
import Combine
import CoreLocation

/// GeoDataStore håndterer søk etter steder via Geoapify.
///
/// Den holder på søkekriterier, søkeresultater og eventuelle feilmeldinger.
/// Klassen er @MainActor fordi den oppdaterer UI-relatert state.

@MainActor final class GeoDataStore: ObservableObject
{
  // Liste over steder hentet fra Geoapify
  @Published var places: [GeoFeature] = []

  // 1️⃣ Valg av kategori som hotell, restaurant eller café
  @Published var selectedCategory: Category = .hotel

  // 2️⃣ Søketekst fra brukeren, for eksempel "pizza"
  @Published var searchText: String = ""

  // 3️⃣ Søkeradius i meter fra sentrum av kartet
  @Published var searchRadius: Int = 10_000

  // 4️⃣ Senterkoordinat for søket (typisk kartets midtpunkt)
  @Published var centerCoordinate: CLLocationCoordinate2D?

  // 5️⃣ Eventuell feilmelding som vises til brukeren
  @Published var errorMessage: String?

  /// Henter steder fra Geoapify basert på gjeldende søkekriterier.
  ///
  /// Denne funksjonen bygger en URL med brukerens søkeparametere og sender et asynkront kall til Geoapify API.
  /// Resultatet lagres i `places`, og eventuelle feil vises i `errorMessage`.

  func fetchPlaces() async
  {
    // 1️⃣ Sjekker at sentrum er satt
    guard let center = centerCoordinate else
    {
      errorMessage = """
      Søket kan ikke utføres fordi kartets sentrum ikke er definert.
      Kontroller at kartet er lastet inn, og prøv igjen.
      """
      return
    }

    // 2️⃣ Bygger URL med de forskjellige søkekriterier
    var address = URLComponents(string: "https://api.geoapify.com/v2/places")!
    var queryItems: [URLQueryItem] = []

    if !searchText.isEmpty
    {
      queryItems.append(URLQueryItem(name: "text", value: searchText))
    }

    queryItems.append(URLQueryItem(name: "categories", value: selectedCategory.value))
    queryItems.append(URLQueryItem(name: "filter", value: "circle:\(center.longitude),\(center.latitude),\(searchRadius)"))
    queryItems.append(URLQueryItem(name: "limit", value: "10"))
    queryItems.append(URLQueryItem(name: "apiKey", value: Bundle.main.getAPIKey))

    address.queryItems = queryItems

    // 3️⃣ Sjekker at URL er gyldig
    guard let url = address.url else
    {
      errorMessage = """
      Kunne ikke bygge en gyldig URL for søket.
      Kontroller søkeparametrene og prøv igjen.
      """
      return
    }

    // 4️⃣ Henter steder
    do
    {
      let response = try await fetchGeoResponse(from: url.absoluteString)

      places = response.features
      errorMessage = nil
    }
    catch
    {
      errorMessage = """
      Det oppstod en feil under henting av steder fra Geoapify.
      Feildetaljer: \(error.localizedDescription)
      Kontroller internettforbindelsen og prøv igjen.
      """
      places = []
    }
  }

  /// Oppdaterer søkekriteriene og henter nye steder fra Geoapify.
  ///
  /// Denne funksjonen lar deg endre én eller flere søkeparametere samtidig.
  /// Hvis en parameter ikke er satt `nil`, beholdes den eksisterende verdien.
  /// Etter oppdatering kalles `fetchPlaces()` for å hente nye resultater.
  ///
  /// Denne metoden er `async` og må kalles med `await`.
  /// Den oppdaterer `@Published` egenskaper som brukes til å styre UI og søk.

  func updateCriteria(category: Category? = nil,
                      text: String? = nil,
                      radius: Int? = nil,
                      center: CLLocationCoordinate2D? = nil) async
  {
    // Oppdater kun verdier som er eksplisitt gitt
    selectedCategory = category ?? selectedCategory
    searchText = text ?? searchText
    searchRadius = radius ?? searchRadius
    centerCoordinate = center ?? centerCoordinate

    // Henter oppdaterte steder basert på nye kriterier
    await fetchPlaces()
  }
}
