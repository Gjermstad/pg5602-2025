//
//  GeoCategory.swift
//  Beacon
//
//  Created by Stig Højklint on 26/10/2025.
//

import SwiftUI

// 5️⃣ Kategorier til stedet
struct GeoCategory: Decodable
{
  let category: String
}

/// Enum som representerer ulike kategorier for GeoApify API-søk
/// - Den brukes for å generere riktige søketekster for hver kategori.
/// - Kan brukes i Picker, ForEach eller direkte i API-kall.

enum Category: String, CaseIterable, Identifiable
{
  case hotel
  case restaurant
  case cafe
  case all

  // Identifikator som brukes for ForEach eller SwiftUI Views
  var id: String { rawValue }

  // Returnerer søketekst som brukes i API-kall
  var value: String
  {
    switch self
    {
    case .hotel:
      return "accommodation.hotel,accommodation.hostel,accommodation.motel,accommodation.guest_house"
    case .restaurant:
      return "catering.restaurant,catering.fast_food"
    case .cafe:
      return "catering.cafe,commercial.food_and_drink.bakery"
    case .all:
      return "accommodation,catering,commercial"
    }
  }
}
