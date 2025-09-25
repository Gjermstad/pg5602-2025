//
//  Aircraft.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 10/10/2023.
//

import Foundation
import SwiftData

@Model final class Airplane
{
  @Attribute(.unique) var id: UUID
  var registration: String                      // F.eks. LN-MLM
  var type: String                              // PA32R
  var name: String                              // Piper Saratoga
  var avatar: String
  var seats: Int                                // Antall seter
  var ifr: Bool                                 // Godkjent for instrument flyging
  var twin: Bool                                // 1-motors eller 2-motors
  var turbine: Bool                             // Stempel eller turbin motor
  var iceprotection: Bool
  var multipilot: Bool                          // Multi Pilot Aircraft
  var simulator: Bool
  var service: String                           // Totaltid til neste 50/100 timers inspeksjon
  var arc: Date                                 // Utløpsdato for Airworthiness Review Certificates
  var extinguisher: Date                        // Utløpsdato for brannslukker apparat
  var firstaid: Date                            // Utløpsdato for førstehjelp utstyr
  var note: String
  var favorite: Bool
  var trash: Bool
  let create: Date
  var update: Date
  
  @Relationship(deleteRule: .noAction, inverse: \Flight.airplane)
  var flights: [Flight]?
  
  init(registration: String = "")
  {
    id = UUID()
    self.registration = registration
    type = ""
    name = ""
    avatar = ""
    seats = 0
    ifr = false
    twin = false
    turbine = false
    iceprotection = false
    multipilot = false
    simulator = false
    service = ""
    arc = Date.now
    extinguisher = Date.now
    firstaid = Date.now
    note = ""
    favorite = false
    trash = false
    create = Date.now
    update = Date.now
  }
}
