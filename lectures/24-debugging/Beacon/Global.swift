//
//  Global.swift
//  Atlas
//

import SwiftUI
import MapKit

//
// ViewModifier for styling av pins/markører på kartet.
// Brukes for å gi en konsistent visuell stil til alle kartpins i appen.
//
struct pinStyle: ViewModifier
{
  func body(content: Content) -> some View
  {
    content
      .font(.title)               // Stor tekst/ikon
      .fontWeight(.bold)          // Fet skrift for bedre synlighet
      .padding(7)                 // Plass rundt ikonet
      .background(.bar)           // Halvgjennomsiktig bakgrunn
      .clipShape(Circle())        // Rund form
      .opacity(0.5)               // 50% gjennomsiktighet
      .shadow(radius: 5)          // Skygge for dybdeeffekt
  }
}

//
// Extension på View som legger til en praktisk modifier-metode for pin-styling.
// I stedet for å skrive .modifier(pinStyle()) hver gang, kan du bruke .stylePin()
//
extension View
{
  func stylePin() -> some View
  {
    modifier(pinStyle())
  }
}

let defaultLongitude: Double = 6.701747442200728
let defaultLatitude: Double = 58.09661439369582

//
// Extension for CLLocationCoordinate2D med forhåndsdefinerte lokasjoner.
// Gjør det enkelt å referere til ofte brukte koordinater uten å hardkode
//
extension CLLocationCoordinate2D
{
  static let farsund = CLLocationCoordinate2D(
    latitude: defaultLatitude,
    longitude: defaultLongitude
  )
}

//
// Extension for MapCameraPosition med forhåndsdefinerte kartposisjoner.
// Gjør det enkelt å sette kartets startposisjon til kjente steder
//
extension MapCameraPosition
{
  static var farsund: MapCameraPosition
  {
    let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    return .region(MKCoordinateRegion(center: .farsund, span: span))
  }
}

//
// Lager en MapCameraPosition basert på lat/lon
// Returnerer en MapCameraPosition som kan brukes i SwiftUI Map
//
func cameraPosition(lat: Double?, lon: Double?) -> MapCameraPosition?
{
  // Sjekker at vi har gyldige koordinater.
  // Hvis enten lat eller lon mangler, returneres nil.
  guard let lat = lat, let lon = lon else { return nil }

  // Lager et CLLocationCoordinate2D for senteret av kartet
  let center = CLLocationCoordinate2D(latitude: lat, longitude: lon)

  // Definerer zoomnivå / utstrekning til kartet
  let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)

  // Lager en MKCoordinateRegion med senter og span
  let region = MKCoordinateRegion(center: center, span: span)

  // Konverterer region til MapCameraPosition slik at SwiftUI Map kan bruke den
  return MapCameraPosition.region(region)
}
