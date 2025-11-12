//
//  GeoProperties.swift
//  Beacon
//
//  Created by Stig Højklint on 26/10/2025.
//

import Foundation

// 3️⃣ Metadata for stedet
struct GeoProperties: Decodable
{
  let placeId: String?
  let name: String?
  let country: String?
  let county: String?
  let city: String?
  let municipality: String?
  let postcode: String?
  let district: String?
  let street: String?
  let formatted: String?
  let lon, lat: Double?
  let categories: [String]
  let website: String?

  enum CodingKeys: String, CodingKey
  {
    case name
    case country
    case county
    case city
    case municipality
    case postcode
    case district
    case street
    case formatted
    case lon, lat
    case categories
    case website
    case placeId = "place_id"
  }
}
