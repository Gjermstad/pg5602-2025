//
//  Places.swift
//  Atlas
//
//  Created by Stig Orla Sørli Højklint on 21/10/2025.
//

import SwiftUI

// Combine er Apples rammeverk for reaktiv programmering,
// altså for å observere og reagere på data som endrer seg over tid
// @Published, ObservableObject, Publisher, Subscriber, osv.
import Combine

//
// ⚠️ Strukturen for et enkelt sted
//
struct Place: Identifiable
{
  let id = UUID()
  let name: String
  let lat: Double
  let lon: Double
}

//
// ⚠️ Klasse som inneholder ARRAY/tabell og metoder
//
final class PlaceStore: ObservableObject
{
  @Published var places: [Place]

  init()
  {
    places = avinorAirports
  }

  func addCities()
  {
    places.removeAll()
    places.append(contentsOf: norwegianCities)
  }

  func addAvinor()
  {
    places.removeAll()
    places.append(contentsOf: avinorAirports)
  }

  func addNonAvinor()
  {
    places.removeAll()
    places.append(contentsOf: nonAvinorAirports)
  }
}
