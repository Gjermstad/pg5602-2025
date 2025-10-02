//
//  CategoryEdit.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 26/09/2025.
//

import SwiftUI

struct CategoryEdit: View
{
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var context
  
  var category: CategoryModel
  
  @State private var title: String
  @State private var notes: String
  
  init(category: CategoryModel)
  {
    self.category = category
      
    _title = State(initialValue: category.title)
    _notes = State(initialValue: category.notes)
  }
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        TextField("Tittel", text: $title)
        
        Section("Notater")
        {
          TextEditor(text: $notes).frame(minHeight: 200)
        }
        
        Section
        {
          Text("Opprettet: \(category.create.formatted(date: .abbreviated, time: .standard))")
          Text("Sist endret: \(category.update.formatted(date: .abbreviated, time: .standard))")
        }
        .foregroundStyle(.secondary)
      }
      .navigationBarTitle("Redigere ✏️")
      .toolbar
      {
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            category.title = title
            category.notes = notes
            category.update = .now
            
            dismiss()
          }
        }
      }
    }
  }
}

#Preview
{
  CategoryEdit(category: category)
}
