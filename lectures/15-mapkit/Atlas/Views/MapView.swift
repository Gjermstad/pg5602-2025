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
  @State private var position: MapCameraPosition = .automatic
  
  @State private var showConfig = false
  @State private var showSearch = false
  
  var body: some View
  {
    ZStack
    {
      Map(position: $position)
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
      
    }
    .sheet(isPresented: $showSearch)
    {
      
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
