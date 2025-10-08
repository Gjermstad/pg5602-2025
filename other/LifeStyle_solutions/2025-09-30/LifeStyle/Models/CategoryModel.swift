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
  var trashbin: Bool
  var create: Date
  var update: Date
  
  // Definerer en relasjon mellom CategoryModel og ExerciseModel.
  // deleteRule: .nullify betyr at hvis denne kategorien slettes, blir category-feltet
  // i ExerciseModel-objekter satt til nil (i stedet for å slette øvelsene).
  @Relationship(deleteRule: .nullify, inverse: \ExerciseModel.category)
  var exercises: [ExerciseModel]?
  
  init(title: String = "Tittel", notes: String = "Notater")
  {
    id = UUID()
    self.title = title
    self.notes = notes
    favorite = false
    trashbin = false
    create = .now
    update = .now
  }
}

let category = CategoryModel(title: "Test kategori", notes: "Notater som beskriver test kategorien.")
