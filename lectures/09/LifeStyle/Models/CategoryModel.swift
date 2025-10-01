//
//  Category.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 25/09/2025.
//

import Foundation
import SwiftData

@Model final class CategoryModel
{
  @Attribute(.unique) var id: UUID
  
  var title: String
  var notes: String
  var favorite: Bool
  var trashBin: Bool
  var create: Date
  var update: Date
  
  // Relasjon til Exercise.
  // Én Category kan ha mange Exercise.
  // deleteRule: .noAction betyr at hvis kategorien slettes,
  // beholdes øvelsene i databasen (de mister bare koblingen).
  // deleteRule: .nullify vil fjerne relasjonen til andre tabeller om slettet
  // inverse: \Exercise.category peker tilbake til motsatt side av relasjonen.
  @Relationship(deleteRule: .nullify, inverse: \ExerciseModel.category)
  var exercises: [ExerciseModel]?
  
  init(title: String = "Tittel", notes: String = "Notater")
  {
    id = UUID()
    self.title = title
    self.notes = notes
    favorite = false
    trashBin = false
    create = .now
    update = .now
  }
}

let category = CategoryModel(title: "Lett", notes: "Lav intensitet, rolig tempo, lite fysisk og mental belastning.")

