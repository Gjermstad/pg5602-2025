//
//  Quote.swift
//  BreakingBad
//
//  Created by Stig Orla Sørli Højklint on 08/10/2025.
//

import Foundation

// Definerer en struktur som representerer et sitat
// Strukturene kan dekodes fra JSON (Decodable) og har en unik identifikator (Identifiable)
struct Quote: Decodable, Identifiable
{
  // Unik ID for hvert sitat – nødvendig for SwiftUI-lister som bruker Identifiable
  // Verdien genereres automatisk når en ny Quote-instans opprettes
  var id = UUID()
  
  let quote: String
  let author: String
  
  // Enum som definerer hvilke felter som skal dekodes fra JSON
  // Her matcher vi JSON-feltene direkte med property-navnene
  enum CodingKeys: String, CodingKey
  {
    case quote, author
  }
}

//
// ⚠️ Henter sitater fra API server
//

func getQuotes(number: Int) async -> [Quote]
{
  let url = "https://api.breakingbadquotes.xyz/v1/quotes/\(number)"
  print("🛜 \(url)\n")
  
  // Prøver å opprette kontakt/session med API server
  guard let connection = URL(string: url) else
  {
    print("⚠️ Beklager, det oppstod en feil med URL-en. Vennligst kontroller adressen og prøv igjen.")
    
    // Returnerer tom tabell på grunn av feil
    return [Quote]()
  }
  
  do
  {
    // Prøver å laste ned data fra serveren
    // URLSession returnerer en tupple (to verdier)
    let (data, response) = try await URLSession.shared.data(from: connection)
    
    /*
     I Swift kan du bruke et komma i en if-setning til å lage en kombinert betingelse.
     Når du bruker et komma på denne måte, evalueres hver del af if-setningen i rekkefølge,
     og if-blokken kjøres bare dersom alle forhold er sann.
     */
    
    // Undersøker om httpResponse er ulik NIL og sjekker deretter om statuskode er mellom 200 og 299
    // Men for å få tilgang til statuskode (200, 404, 500 osv.), må du typekonvertere den til HTTPURLResponse.
    // as? prøver denne konverteringen:
    // (200...299) er et lukket tallområde og .contains sjekker om statuskoden ligger innenfor dette området
    if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
    {
      print("⚠️ Response: \(httpResponse.statusCode)")
      
      // Innholdet i data er en binær representasjon – skriver ut antall bytes
      print("⚠️ Antall bytes lastet ned: \(data)\n")
      
      // Skriver ut innholdet i JSON format
      print(String(data: data, encoding: .utf8) ?? "Ingen JSON-tekst")
      
      // Dekoder data i samsvar med tabellstruktur og returnerer artiklene
      // JSONDecoder kan kaste en feil, derfor vi legger til en `try`
      return try JSONDecoder().decode([Quote].self, from: data)
    }
  }
  catch
  {
    print("⚠️ Beklager! Noe gikk galt under nedlasting eller tolkning av data: \(error.localizedDescription)")
  }
  
  // Returnerer tom tabell på grunn av feil
  return [Quote]()
}
