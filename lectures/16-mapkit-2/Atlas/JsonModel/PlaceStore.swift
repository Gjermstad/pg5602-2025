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

// Codable er en protokoll som lar en type enkelt lagres og gjenopprettes
// til filer som JSON eller database eller via en REST API.
// SwiftData og JSONDecoder/JSONEncoder bruker Codable-systemet.
enum Category: Int, Codable
{
  // Vi må ikke ha med tallverdien om vi teller opp fra 0, for Swift starter automatisk på 0
  case city = 0
  case avinor = 1
  case nonAvinor = 2
  
  // Category utvides med en extension i Global for å returnere en tupple med ikon-navn og farge i en switch
}

//
// ⚠️ Strukturen for et enkelt sted
//
struct Place: Identifiable
{
  let id = UUID()
  let name: String
  let category: Category
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
