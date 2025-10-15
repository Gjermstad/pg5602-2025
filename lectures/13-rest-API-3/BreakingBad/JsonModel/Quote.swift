//
//  Quote.swift
//  BreakingBad
//
//  Created by Stig Orla Sørli Højklint on 13/10/2025.
//

import Foundation

struct Quote: Decodable, Identifiable
{
  let id = UUID()
  let quote: String
  let author: String
  
  enum CodingKeys: String, CodingKey
  {
    case quote
    case author
  }
}
//
// ⚠️ Henter sitater fra API Server
//

func fetchQuotes(number: Int) async -> [Quote]
{
  // Setter sammen URL-en til API-endepunktet
  let url = "https://api.breakingbadquotes.xyz/v1/quotes/\(number)"
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
    return try JSONDecoder().decode([Quote].self, from: data)
  }
  catch
  {
    print ("⚠️ Beklager feil ved nedlasting eller dekoding av data: \(error.localizedDescription)\n")
  }
  
  return []
}
