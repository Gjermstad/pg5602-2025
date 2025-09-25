//
//  Category.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 07/10/2023.
//

import Foundation
import SwiftData

@Model final class Category
{
  @Attribute(.unique) var id: UUID
  var name: String
  var note: String
  var favorite: Bool
  var trash: Bool
  var create: Date
  var update: Date
  
  @Relationship(deleteRule: .noAction, inverse: \Flight.category)
  var flights: [Flight]?
  
  init(name: String = "", note: String = "")
  {
    id = UUID()
    self.name = name
    self.note = note
    favorite = false
    trash = false
    create = Date.now
    update = Date.now
  }
}
