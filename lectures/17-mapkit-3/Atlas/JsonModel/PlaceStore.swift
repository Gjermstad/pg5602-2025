//
//  Places.swift
//  Atlas
//
//  Created by Stig Orla Sørli Højklint on 21/10/2025.
//

import SwiftUI
import MapKit

// Combine er Apples rammeverk for reaktiv programmering,
// altså for å observere og reagere på data som endrer seg over tid
// @Published, ObservableObject, Publisher, Subscriber, osv.
import Combine

// Codable er en protokoll som lar en type enkelt lagres og gjenopprettes
// til filer som JSON eller database eller via en REST API.
// SwiftData og JSONDecoder/JSONEncoder bruker Codable-systemet.
enum Category: Int, Codable
{
  case city = 0
  case avinor = 1
  case nonavinor = 2
}

// Utvider enum Category med en beregnet egenskap (computed property)
// som returnerer et passende SF Symbol og en farge til bruk i UI-et.
extension Category
{
  // Returnerer et tuple basert på hvilken kategori stedet tilhører.
  var symbol: (String, Color)
  {
    switch self
    {
    case .city: return ("house.fill", Color.brown)
    case .avinor: return ("airplane", Color.red)
    case .nonavinor: return ("paperplane.fill", Color.blue)
    }
  }
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
    places = []
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
  
  func removePlaces()
  {
    places.removeAll()
  }
  
  // Beregner en region som dekker alle steder i PlaceStore
  func zoomToFit() -> MKCoordinateRegion?
  {
    // Sjekker at listen ikke er tom
    guard !places.isEmpty else { return nil }
    
    // Finner minste og største breddegrad
    let minLat = places.map { $0.lat }.min()! // ! sier at vi garanterer at det finnes en verdi
    let maxLat = places.map { $0.lat }.max()!
    
    // Finner minste og største lengdegrad
    let minLon = places.map { $0.lon }.min()!
    let maxLon = places.map { $0.lon }.max()!
    
    // Regner ut midtpunkt
    let center = CLLocationCoordinate2D(
      latitude: (minLat + maxLat) / 2,
      longitude: (minLon + maxLon) / 2
    )
    
    // Span med litt ekstra margin
    let span = MKCoordinateSpan(
      latitudeDelta: (maxLat - minLat) * 1.25,
      longitudeDelta: (maxLon - minLon) * 1.25
    )
    
    return MKCoordinateRegion(center: center, span: span)
  }
}
