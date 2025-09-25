//
//  FlightView.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 11/10/2023.
//

import SwiftData
import SwiftUI
import MapKit

struct FlightView: View
{
  @State private var position: MapCameraPosition = .automatic
  
  @Query(filter: #Predicate<Airport>{$0.trash == false},
         sort: \Airport.icao, animation: .default) private var airports: [Airport]

  var body: some View
  {
    Map(position: $position)
    {
      ForEach(airports)
      {
        airport in
        
        Marker(airport.icao, coordinate: airport.coordinate)
      }
    }
    .mapStyle(.standard(elevation: .automatic))
    .mapControls
    {
      MapUserLocationButton()
      MapCompass()
      MapScaleView()
    }
  }
}

#Preview
{
  FlightView().modelContainer(for: Flight.self)
}
