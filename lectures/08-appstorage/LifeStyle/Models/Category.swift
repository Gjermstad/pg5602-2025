//
//  Category.swift
//  LifeStyle
//
//  Created by Kenneth Andre Bettum Gjermstad on 25/09/2025.
//

import Foundation
import SwiftData

@Model final class Category
{
  @Attribute(.unique) var id: UUID
  var title: String
  var notes: String
  var archived: Bool = false
  var createdAt: Date
  var updatedAt: Date
  
  // Vi sier vi har en relasjon hvor Category kan være koblet sammen med mange exercises
  // ? på slutten sier at det må ikke finnes en relasjon, f.eks. ved en ny kategori
  // deleteRule sier hva som skjer om du sletter relasjonen
  @Relationship(deleteRule: .noAction, inverse: \Exercise.category)
  var exercises: [Exercise]?
  
  init(title: String, notes: String = "")
  {
    id = UUID()
    self.title = title
    self.notes = notes
    archived = false
    createdAt = .now
    updatedAt = .now
  }
}

let category1 = Category(title: "Løping")
let category2 = Category(title: "Svømming")
let category3 = Category(title: "Styrketrening")
let category4 = Category(title: "Sykling")
