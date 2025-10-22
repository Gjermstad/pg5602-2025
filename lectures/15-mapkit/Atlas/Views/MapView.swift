//
//  MapView.swift
//  Atlas
//
//  Created by Kenneth Andre Bettum Gjermstad on 22/10/2025.
//

import SwiftUI
import MapKit

struct MapView: View
{
  // Henter ut context databasen hvor vi la plassene
  @EnvironmentObject private var placeStore: PlaceStore
  
  // Her lager vi to forskjellige posisjoner vi kan bruke som startpunkt når kartet vises
  @State private var position1: MapCameraPosition = .automatic
  @State private var position2: MapCameraPosition

  @State private var showConfig = false
  @State private var showSearch = false
  
  init()
  {
    let center = CLLocationCoordinate2D(latitude: 63.4317, longitude: 10.395)
    // For span bør både latitude og longitude være det samme
    let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    let region = MKCoordinateRegion(center: center, span: span)
    
    _position2 = State(initialValue: MapCameraPosition.region(region))
  }
  
  var body: some View
  {
    ZStack
    {
      // Her velger vi hvilken av de to startposisjonene kartet skal bruke
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
          Image(systemName: "location.fill")
            .modifier(myModifier())
        }
        .padding()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .trailing)
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
      .presentationDetents([.fraction(0.25)])
      .buttonStyle(.glassProminent)
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

#Preview {
  // VI legger til NavigationStack slik at vi kan se Toolbar-knappene i Preview
  NavigationStack
  {
    MapView().environmentObject(PlaceStore())
  }
}
