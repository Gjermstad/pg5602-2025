//
//  Flight.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 10/10/2023.
//

import Foundation
import SwiftData

@Model final class Flight
{
  @Attribute(.unique) let id: UUID
  var airplane: Airplane?
  var from: Airport?
  var to: Airport?
  var category: Category?
  var ifr: Bool
  var rank: String
  var blockoff: Date?
  var takeoff: Date?
  var landing: Date?
  var blockon: Date?
  var note: String
  var favorite: Bool
  var trash: Bool
  let create: Date
  var update: Date
  
  @Relationship(deleteRule: .cascade, inverse: \Location.flight)
  var locations: [Location]?
  
  init()
  {
    id = UUID()
    ifr = false
    rank = "PIC"
    note = ""
    favorite = false
    trash = false
    create = Date.now
    update = Date.now
  }
}
