//
//  DetailModel.swift
//  Beacon
//

import Foundation
import Combine

//
// DetailModel håndterer henting av detaljert informasjon om et spesifikt sted via Geoapify API.
// Klassen er @MainActor fordi den oppdaterer UI-relatert state (@Published properties).
//
@MainActor final class DetailModel: ObservableObject
{
  // Detaljert informasjon om ett enkelt sted
  // Settes til nil ved oppstart, og oppdateres når fetchDetail() fullføres
  @Published var detail: DetailFeature?
  
  // Statusmelding eller feilmelding som vises til brukeren
  // Settes ved både vellykkede og feilede API-kall
  @Published var message: String?

  @Published var isLoading = false

  //
  // Henter detaljert informasjon om et spesifikt sted fra Geoapify API.
  // Funksjonen oppdaterer "detail" med stedets informasjon ved suksess,
  //
  func fetchDetail(placeId: String) async
  {
    // Start spinner/indikator for lasting
    isLoading = true

    // Sørger for at spinneren alltid stoppes når funksjonen avsluttes,
    // uansett om den fullføres normalt eller kaster en feil
    defer { isLoading = false }
    
    // Bygger URL for Geoapify Place Details API
    var address = URLComponents(string: "https://api.geoapify.com/v2/place-details")!
    
    // Legger til plassens ID og API-nøkkel som query-parametere
    var queries = [URLQueryItem]()
    queries.append(URLQueryItem(name: "id", value: placeId))
    queries.append(URLQueryItem(name: "apiKey", value: "\(Bundle.main.apiKey)"))
    address.queryItems = queries
    
    // Validerer at URL-en er gyldig før API-kall
    guard let url = address.url else
    {
      message = "Ugyldig URL – sjekk parametrene."
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
      let response = try decoder.decode(DetailResponse.self, from: data)
      
      // Henter første (og eneste) sted fra features-arrayet
      // Place Details API returnerer alltid ett resultat i et array
      detail = response.features.first
      
      // Setter statusmelding basert på responstype
      message = response.type == "FeatureCollection" ? "🛜 Nedlasting vellykket" : "⚠️ Uventet svar fra Geoapify"
    }
    catch
    {
      // Håndterer feil ved nettverkskall eller JSON-dekoding
      message = """
      ⚠️ Feil ved henting fra Geoapify: \(error.localizedDescription)
      
      🫵 Kontroller internettforbindelsen og prøv igjen.
      """
    }
  }
}
