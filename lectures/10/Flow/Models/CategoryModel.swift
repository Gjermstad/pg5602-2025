//
//  CategoryModel.swift
//  Flow
//
//  Created by Stig Orla Sørli Højklint on 02/10/2025.
//

import Foundation
import SwiftData

@Model final class CategoryModel
{
  var id: UUID
  var name: String
  var notes: String?
  
  // .cascade gjør at slettes en kategori så slettes alle relasjonstabeller til kategorien
  @Relationship(deleteRule: .cascade, inverse: \TaskModel.category)
  var tasks: [TaskModel]
  
  init(name: String, notes: String? = nil)
  {
    self.id = UUID()
    self.name = name
    self.notes = notes
    // Vi starter med et tomt array for tasks fra oppstart
    self.tasks = []
  }
}

let exampleCategory = CategoryModel(name: "Eksempel kategori", notes: "Hverdagsoppgaver og husarbeid")
