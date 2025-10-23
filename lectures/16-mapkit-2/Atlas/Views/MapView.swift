//
//  MapView.swift
//  Atlas
//
//  Created by Stig Orla Sørli Højklint on 22/10/2025.
//

import SwiftUI
import MapKit

struct MapView: View
{
  @EnvironmentObject private var placeStore: PlaceStore
  @State private var position1: MapCameraPosition = .automatic
  @State private var position2: MapCameraPosition

  @State private var showConfig = false
  @State private var showSearch = false

  init()
  {
    // Setter et koordinat som skal være midtpunktet på kartet (Trondheim i dette tilfellet)
    let center = CLLocationCoordinate2D(latitude: 63.431, longitude: 10.395)

    // Definerer hvor "zoomet inn" kartet skal være.
    // latitudeDelta og longitudeDelta bestemmer hvor mye av kartet som vises.
    let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)

    // Lager en region som kombinerer midtpunkt og zoomnivå
    let region = MKCoordinateRegion(center: center, span: span)

    // Initialiserer State-variabelen med en MapCameraPosition basert på regionen
    // Dette gjør at kartet starter med denne posisjonen når viewet vises.
    _position2 = State(initialValue: MapCameraPosition.region(region))
  }

  var body: some View
  {
    ZStack
    {
      Map(position: $position2)
      {
        ForEach(placeStore.places)
        {
          place in

          let coordinate = CLLocationCoordinate2D(latitude: place.lat, longitude: place.lon)
          Marker(place.name, coordinate: coordinate)
        }
      }
      .ignoresSafeArea()

      VStack
      {
        Spacer()

        Button
        {
        }
      label:
        {
          Image(systemName: "location.fill").modifier(myModifier())
        }
        .padding()
      }
      .frame(maxWidth: .infinity, alignment: .trailing)
    }
    .toolbar
    {
      ToolbarItem(placement: .topBarLeading)
      {
        Button
        {
          showConfig.toggle()
        }
      label:
        {
          Image(systemName: "line.3.horizontal")
        }
      }

      ToolbarItem(placement: .topBarTrailing)
      {
        Button
        {
          showSearch.toggle()
        }
      label:
        {
          Image(systemName: "magnifyingglass")
        }
      }
    }
    .sheet(isPresented: $showConfig)
    {
      VStack
      {
        Button("Norske byer", action: placeStore.addCities)
        Button("Avinor flyplasser", action: placeStore.addAvinor)
        Button("GA flyplasser", action: placeStore.addNonAvinor)
      }
      .buttonStyle(.glassProminent)
      .presentationDetents([.fraction(0.25)])
    }
    .sheet(isPresented: $showSearch)
    {
      VStack
      {

      }
      .presentationDetents([.fraction(0.3)])
    }
  }
}

#Preview
{
  NavigationStack
  {
    MapView().environmentObject(PlaceStore())
  }
}
