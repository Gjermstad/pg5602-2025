//
//  RecipesEdit.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct RecipesEdit: View {
  @Binding var recipe: Recipe
  @State private var isEditing: Bool = false
  
  var body: some View
  {
    NavigationStack
    {
      // Vises om man trykker Rediger
      if isEditing
      {
        Text("Rediger oppskrift")
        Form {
          TextField(recipe.recipeName, text: $recipe.recipeName)
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
          Text(recipe.recipeName)
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
  RecipesEdit(recipe: .constant(testRecipe))
}
