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
  
  @Relationship(deleteRule: .cascade, inverse: \TaskModel.category)
  var tasks: [TaskModel]
  
  init(name: String, notes: String? = nil)
  {
    self.id = UUID()
    self.name = name
    self.notes = notes
    self.tasks = []
  }
}

let exampleCategory = CategoryModel(name: "Eksempel kategori", notes: "Hverdagsoppgaver og husarbeid")
