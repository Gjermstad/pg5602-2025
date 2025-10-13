//
//  Fruit.swift
//  Fruityvice
//
//  Created by Stig Orla Sørli Højklint on 09/10/2025.
//

import Foundation

struct Nutritions: Codable
{
  let calories: Int
  let fat: Double
  let sugar: Double
  let carbohydrates: Double
  let protein: Double
}

struct Fruit: Codable, Identifiable
{
  let id: Int
  let name: String
  let family: String
  let order: String
  let genus: String
  let nutritions: Nutritions
}

//
// ⚠️ Henter frukter fra API server
//

func getFruits() async -> [Fruit]
{
  let url = "https://fruityvice.com/api/fruit/all"
  print("🛜 \(url)\n")
  
  // Prøver å opprette kontakt/session med API server
  guard let connection = URL(string: url) else
  {
    print("⚠️ Beklager, det oppstod en feil med URL-en. Vennligst kontroller adressen og prøv igjen.")
    
    // Returnerer tom tabell på grunn av feil
    return [Fruit]()
  }
  
  do
  {
    // Prøver å laste ned data fra serveren
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
      return try JSONDecoder().decode([Fruit].self, from: data)
    }
  }
  catch
  {
    print("⚠️ Beklager! Noe gikk galt under nedlasting eller tolkning av data: \(error.localizedDescription)")
  }
  
  // Returnerer tom tabell på grunn av feil
  return [Fruit]()
}
