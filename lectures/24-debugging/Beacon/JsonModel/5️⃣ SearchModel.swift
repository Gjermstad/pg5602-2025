//
//  SearchModel.swift
//  Beacon
//

import Foundation
import MapKit // Se om dette kan minimeres
import Combine

//
// Klassen er merket med @MainActor fordi den oppdaterer
// UI-relatert tilstand gjennom @Published-egenskaper.
//
@MainActor final class SearchModel: ObservableObject
{
  // Liste over steder hentet fra Geoapify API.
  @Published var places: [SearchResult] = []
  
  // Status- eller feilmelding som kan vises i UI.
  @Published var message: String?
  
  //
  // Utfører et asynkront søk etter steder via Geoapify Autocomplete API.
  // Funksjonen dekoder JSON-responsen og oppdaterer "places" når søket lykkes.
  //
  func fetchSearch(text: String, limit: Int) async
  {
    // Bygger URL-komponentene for API-kallet
    var address = URLComponents(string: "https://api.geoapify.com/v1/geocode/autocomplete?")!
    
    // Legger til nødvendige spørringsparametere
    var queries = [URLQueryItem]()
    queries.append(URLQueryItem(name: "text", value: text))
    queries.append(URLQueryItem(name: "limit", value: "\(limit)"))
    queries.append(URLQueryItem(name: "format", value: "json"))
    queries.append(URLQueryItem(name: "apiKey", value: "\(Bundle.main.apiKey)"))
    address.queryItems = queries
    
    // Validerer at URL-en ble korrekt bygd
    guard let url = address.url else
    {
      message = "Ugyldig URL – sjekk parametrene."
      return
    }
    
    do
    {
      // Utfører det asynkrone nettverkskallet til Geoapify
      let (data, response) = try await URLSession.shared.data(from: url)
      
      // Kontroller at vi fikk et gyldig HTTP-svar
      guard let httpResponse = response as? HTTPURLResponse else
      {
        throw URLError(.badServerResponse)
      }
      
      // Kontroller at statuskoden indikerer suksess (200–299)
      guard (200...299).contains(httpResponse.statusCode) else
      {
        throw URLError(.badServerResponse)
      }
      
      // Dekoder JSON-responsen til Swift-modellen SearchResponse
      let decoder = JSONDecoder()
      let responseData = try decoder.decode(SearchResponse.self, from: data)
      
      // Oppdater publiserte verdier for UI
      places = responseData.results
      
      // Viser nedlastet datastørrelse
      message = """
      🛜 Vellykket nedlasting av data.
      ♎️ Lastet ned \(data.count) Byte
      """
    }
    catch
    {
      // Feilhåndtering ved nettverksfeil eller dekodingsfeil
      message = """
      ⚠️ Feil ved henting fra Geoapify: \(error.localizedDescription)
      🫵 Kontroller internettforbindelsen og prøv igjen.
      """
    }
  }
}
