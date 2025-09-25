//
//  Airport.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 08/10/2023.
//

import Foundation
import SwiftData
import MapKit

@Model final class Airport
{
  @Attribute(.unique) let id = UUID()
  var icao: String        // ICAO kode for Bergen: ENBR
  var iata: String        // IATA kode for Bergen: BGO
  var name: String        // F.eks. Flesland flyplass
  var type: String        // Størrelse på flyplass
  var avatar: String
  var frequency: String
  var navigation: String
  var city: String
  var country: String
  var latitude: Double    // Avstand fra ekvator til NORD eller SØR
  var longitude: Double   // Avstand fra Greenwich mot ØST eller VEST
  
  var coordinate: CLLocationCoordinate2D
  {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
  
  var elevation: String
  var note: String
  var favorite: Bool      // Markør for favoritt
  var trash: Bool         // Markør for arkivert
  let create: Date
  var update: Date
  
  @Relationship(deleteRule: .noAction, inverse: \Flight.from)
  @Relationship(deleteRule: .noAction, inverse: \Flight.to)
  var flights: [Flight]?
  
  init(icao: String = "", iata: String = "")
  {
    id = UUID()
    self.icao = icao
    self.iata = iata
    name = ""
    type = ""
    avatar = ""
    frequency = ""
    navigation = ""
    city = ""
    country = ""
    latitude = 0
    longitude = 0
    elevation = ""
    note = ""
    favorite = false
    trash = false
    create = Date.now
    update = Date.now
  }
}
