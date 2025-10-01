//
//  Category.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 25/09/2025.
//

import Foundation
import SwiftData

@Model final class Category
{
  @Attribute(.unique) var id: UUID
  
  var title: String
  var notes: String
  var starred: Bool
  var archive: Bool
  var created: Date
  var updated: Date
  
  // Relasjon til Exercise.
  // Én Category kan ha mange Exercise.
  // deleteRule: .noAction betyr at hvis kategorien slettes,
  // beholdes øvelsene i databasen (de mister bare koblingen).
  // inverse: \Exercise.category peker tilbake til motsatt side av relasjonen.
  @Relationship(deleteRule: .noAction, inverse: \Exercise.category)
  var Exercises: [Exercise]?
  
  init(title: String = "Tittel", notes: String = "Notater")
  {
    id = UUID()
    self.title = title
    self.notes = notes
    starred = false
    archive = false
    created = .now
    updated = .now
  }
}

let category = Category(title: "Lett", notes: "Lav intensitet, rolig tempo, lite fysisk og mental belastning.")

