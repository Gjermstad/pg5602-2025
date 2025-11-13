//
//  PinView.swift
//  Atlas
//

import SwiftUI

struct PinView: View
{
  // Ett bestemt sted hentet fra Geoapify (med navn, adresse, koordinater osv.)
  @Binding var selectedPlace: PlacesFeature?
  
  // Binding til en boolsk verdi i en annen View
  @Binding var showDetail: Bool
  
  var body: some View
  {
    if let place = selectedPlace // Fordi place er optional
    {
      VStack(spacing: 10)
      {
        Text(place.properties.name).font(.headline).bold()
        
        // Adresse, hvis tilgjengelig
        if let address = place.properties.formatted
        {
          Text(address)
            .multilineTextAlignment(.center)
            .font(.subheadline)
        }
        
        HStack
        {
          Button("Mer info")
          {
            // Når brukeren trykker, settes showDetail = true
            // Dette signaliserer til foreldrevisningen at detaljvisning skal vises
            showDetail = true
          }
          
          Button("Lukk")
          {
            selectedPlace = nil
          }
        }
        .buttonStyle(.bordered)
      }
      .padding()
      .frame(maxWidth: 200)      // Maks bredde for å passe i et kart-popup
      .background(.thinMaterial) // Gir en "frostet glass"-effekt
      .cornerRadius(15)          // Runde hjørner
      .shadow(radius: 8)         // Myk skygge for dybdeeffekt
    }
  }
}

#Preview
{
  // Eksempeldata for forhåndsvisning i Xcode Preview
  let properties = PlacesProperties(
    placeId: "12345",
    name: "Bergen Sentrum",
    country: "Norway",
    county: "Vestland",
    city: "Bergen",
    municipality: "Bergen",
    district: "Bergenhus",
    formatted: "Bergen Sentrum, 5003 Bergen, Norway",
    lon: 5.32415,
    lat: 60.39299,
    categories: ["accommodation", "catering"]
  )
  
  let geometry = PlacesGeometry(
    type: "Point",
    coordinates: [5.32415, 60.39299]
  )
  
  let place = PlacesFeature(
    type: "Feature",
    properties: properties,
    geometry: geometry
  )
  
  // Viser PinView inne i en NavigationStack
  // og binder showDetail til en konstant false-verdi for testformål
  NavigationStack
  {
    PinView(selectedPlace: .constant(place), showDetail: .constant(false))
  }
}
