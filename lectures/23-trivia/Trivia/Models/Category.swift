//
//  Category.swift
//  Trivia
//
//  Created by Stig Orla Sørli Højklint on 28/10/2025.
//

import Foundation

//
// En struktur som representerer svaret fra API-et når man henter kategorier
//
struct CategoryResponse: Decodable
{
  let categories: [Category]

  // En enum som brukes til å mappe mellom Swift-egenskaper og JSON-nøkler
  // Oversetter mellom snake_case (som ofte brukes i JSON) til camelCase (som brukes i Swift).
  enum CodingKeys: String, CodingKey
  {
    case categories = "trivia_categories"
  }
}

//
// En struktur som representerer én enkelt kategori i API-et
//
struct Category: Decodable, Identifiable
{
  let id: Int
  let name: String
}

//
// Henter kategorier fra Trivia API server
//
func fetchCategories() async -> [Category]
{
  let url = "https://opentdb.com/api_category.php"
  
  guard let connection = URL(string: url) else
  {
    print("⚠️ Beklager, ugyldig URL.")
    return []
  }
  
  do
  {
    let (data, _) = try await URLSession.shared.data(from: connection)

    let decoder = JSONDecoder()
    let response = try decoder.decode(CategoryResponse.self, from: data)
    return response.categories
  }
  catch
  {
    print("⛔️ Beklager, feil! \(error.localizedDescription)")
  }

  return []
}

