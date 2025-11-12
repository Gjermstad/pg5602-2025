//
//  fetchGeoResponse.swift
//  Beacon
//
//  Created by Stig Højklint on 26/10/2025.
//

import Foundation

/// Henter GeoResponse fra en gitt URL til Geoapify API.
///
/// Denne funksjonen:
/// 1. Validerer URL-en.
/// 2. Henter data asynkront fra serveren.
/// 3. Sjekker HTTP-responsen og statuskode.
/// 4. Dekoder JSON-data til `GeoResponse`-modellen.
///
/// - Parameter url: Strengen som representerer API-endepunktet (f.eks. autocomplete eller place details).
/// - Returns: Et `GeoResponse`-objekt som inneholder alle features fra API-et.
/// - Throws: `URLError` hvis URL-en er ugyldig, hvis responsen ikke er HTTP, eller hvis statuskoden ikke er 200–299.

func fetchGeoResponse(from url: String) async throws -> GeoResponse
{
  // 1️⃣ Sørger for at URL-en er gyldig
  guard let url = URL(string: url) else
  {
    throw URLError(.badURL)
  }
  
  // 2️⃣ Laster ned data fra API-et asynkront
  let (data, response) = try await URLSession.shared.data(from: url)
  
  // 3️⃣ Sjekker at responsen er en HTTP-respons
  guard let httpResponse = response as? HTTPURLResponse else
  {
    throw URLError(.badServerResponse)
  }
  
  // 4️⃣ Sjekker at statuskoden er OK (200–299)
  guard (200...299).contains(httpResponse.statusCode) else
  {
    throw URLError(.badServerResponse)
  }
  
  let decoder = JSONDecoder()
  
  // 5️⃣ Sørger for at snake_case fra JSON konverteres til camelCase i Swift-modeller.
  decoder.keyDecodingStrategy = .convertFromSnakeCase
  
  // 6️⃣ Prøver å dekode dataene til GeoResponse.
  let geoResponse = try decoder.decode(GeoResponse.self, from: data)
  
  // 7️⃣ Returner ferdig dekodet GeoResponse
  return geoResponse
}
