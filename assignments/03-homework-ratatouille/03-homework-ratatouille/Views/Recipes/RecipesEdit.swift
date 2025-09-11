//
//  RecipesEdit.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct RecipesEdit: View {
  @Binding var recipe: Recipe
  // Gjør det mulig å kalle `dismiss()` for å lukke .sheet
  @Environment(\.dismiss) private var dismiss
  
  var body: some View
  {
    NavigationStack
    {
      Text("Rediger oppskrift")
      Form
      {
        Section("Navn") {
          TextField(recipe.recipeName, text: $recipe.recipeName)
        }
        Section("Kort beskrivelse") {
          TextField(recipe.ingress, text: $recipe.ingress)
        }
        Section("Notater") {
          TextField(recipe.notes, text: $recipe.notes)
        }
      }
      .toolbar
      {
        ToolbarItem(placement: .cancellationAction)
        {
          Button
          {
            dismiss()
          }
        label:
          {
            Text("Avbryt")
          }
        }
        ToolbarItem(placement: .confirmationAction)
        {
          Button
          {
            dismiss()
          }
        label:
          {
            Text("Lagre")
          }
        }
      }
    } // End NavigationStack
    
    // Info rundt hvordan Sheet med dette viewet ser ut
    .presentationDetents([.large])
    .presentationCornerRadius(45)
  }
}

#Preview {
  RecipesEdit(recipe: .constant(testRecipe))
}
