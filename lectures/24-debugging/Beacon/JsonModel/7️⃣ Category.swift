//
//  Category.swift
//  Beacon
//

import Foundation
import SwiftUI

//
// Kategorier for Geoapify-søk
// Brukes til å filtrere hvilke typer steder som hentes fra API-et.
//
enum Category: String
{
  case hotel      // Hoteller, moteller, vandrerhjem osv.
  case restaurant // Restauranter og hurtigmatsteder
  case cafe       // Kafeer og bakerier
  case all        // Kombinerer overnattings- og serveringssteder
  
  // Returnerer kategoriteksten som brukes i API-kallet til Geoapify
  var value: String
  {
    switch self
    {
    case .hotel: return "accommodation.hotel,accommodation.hostel,accommodation.motel,accommodation.guest_house"
    case .restaurant: return "catering.restaurant,catering.fast_food"
    case .cafe: return "catering.cafe,commercial.food_and_drink.bakery"
    case .all: return "accommodation,catering"
    }
  }
  
  // Returnerer et tuple basert på hvilken kategori stedet tilhører.
  var symbol: (String, Color)
  {
    switch self
    {
    case .hotel: return ("house.fill", Color.brown)
    case .restaurant: return ("fork.knife", Color.red)
    case .cafe: return ("cup.and.saucer.fill", Color.blue)
    case .all: return ("pin.fill", Color.blue)
    }
  }
}
