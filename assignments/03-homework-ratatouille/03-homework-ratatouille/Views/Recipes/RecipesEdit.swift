//
//  RecipesEdit.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct RecipesEdit: View {
  @Binding var recipe: String
  @State private var isEditing: Bool = false
  @FocusState private var textFieldIsFocused: Bool
  
  var body: some View
  {
    NavigationStack
    {
      // Vises om man trykker Rediger
      if isEditing
      {
        Text("Rediger oppskrift")
        Form {
          TextField(recipe, text: $recipe)
            .focused($textFieldIsFocused)
        }
        .toolbar
        {
          ToolbarItem(placement: .topBarTrailing)
          {
            Button
            {
              isEditing.toggle()
            }
          label:
            {
              Text("Rediger")
            }
          }
        }
      }
      
      // Vises når man trykker inn på en oppskrift
      else
      {
        Form
        {
          Text(recipe)
        }
        .toolbar
        {
          ToolbarItem(placement: .topBarTrailing)
          {
            Button
            {
              isEditing.toggle()
            }
          label:
            {
              Text("Rediger")
            }
          }
        }
      }
    }
  }
}

#Preview {
  RecipesEdit(recipe: .constant("Pizza"))
}
