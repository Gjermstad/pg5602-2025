//
//  CategoryAdd.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 26/09/2025.
//

import SwiftData
import SwiftUI

struct CategoryAdd: View
{
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) private var dismiss
  
  @State private var title = ""
  @State private var notes = ""
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        Section
        {
          TextField("Tittel", text: $title)
        }
        
        Section("Notater")
        {
          TextEditor(text: $notes).frame(minHeight: 200)
        }
      }
      .navigationBarTitle("Ny ✏️")
      .toolbar
      {
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            let category = CategoryModel()
            
            category.title = title
            category.notes = notes
            context.insert(category)
            
            do
            {
              try context.save()
              dismiss()
            }
            catch
            {
              print("Failed to save changes: \(error)")
            }
          }
          .disabled(title.isEmpty)
        }
      }
    }
  }
}

#Preview
{
  CategoryAdd()
}


