//
//  Fruit.swift
//  FruityVice
//
//  Created by Kenneth Andre Bettum Gjermstad on 15/10/2025.
//

import Foundation

struct Fruit: Codable, Identifiable, Hashable
{
  let name: String
  let id: Int
  let family: String
  let order: String
  let genus: String
  let nutritions: Nutrition
}

struct Nutrition: Codable, Hashable
{
  let calories: Double
  let fat: Double
  let sugar: Double
  let carbohydrates: Double
  let protein: Double
}

//
// ⚠️ Henter frukt fra FruityVice
//

func fetchFruits() async -> [Fruit]
{
  // Setter sammen URL-en til API-endepunktet
  let url = "https://fruityvice.com/api/fruit/all"
  print("🛜 \(url)")
  
  // Prøver å få kontakt med API Server
  guard let connection = URL(string: url) else
  {
    print("⚠️ Ugyldig URL, kan ikke koble til Breaking Bad server.")
    return []
  }
  
  do
  {
    // Prøver å laste ned data fra API Server
    let (data, response) = try await URLSession.shared.data(from: connection)
    print("🤖 Antall byte lasted ned: \(data)")
    
    // Sjekker først at responsen fra URLSession faktisk er en HTTP-respons
    if let httpResponse = response as? HTTPURLResponse
    {
      // Henter statuskoden fra HTTP-responsen (f.eks. 200, 404, 500)
      let status = httpResponse.statusCode
      
      // Sjekker om statuskoden er innenfor gyldig område 200–299
      if (200...299).contains(status)
      {
        print("✅ Serveren svarte med gyldig status: \(status)\n")
      }
      else
      {
        print("⚠️ Serveren svarte med feilkode: \(status)\n")
        return []
      }
    }
    
    // Prøver å dekode data fra API Server
    return try JSONDecoder().decode([Fruit].self, from: data)
  }
  catch
  {
    print ("⚠️ Beklager feil ved nedlasting eller dekoding av data: \(error.localizedDescription)\n")
  }
  
  return []
}

