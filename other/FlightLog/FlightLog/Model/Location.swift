//
//  Location.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 04/11/2023.
//

import Foundation
import SwiftData
import MapKit

@Model final class Location
{
  @Attribute(.unique) let id: UUID
  let flight: Flight
  let action: String
  let latitude: Double
  let longitude: Double
  let create: Date
  
  var coordinate: CLLocationCoordinate2D
  {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
  
  init(flight: Flight, action: String)
  {
    id = UUID()
    self.flight = flight
    self.action = action
    latitude = 0.0
    longitude = 0.0
    create = Date.now
  }
}
