//
//  RecipesEdit.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct RecipesEdit: View {
  @State var draft: Recipe
  var onSave: (Recipe) -> Void
  
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
          TextField("Navn", text: $draft.recipeName)
        }
        Section("Kort beskrivelse") {
          TextField("Ingress", text: $draft.ingress)
        }
        Section("Notater") {
          TextEditor(text: $draft.notes)
        }
      }
      .toolbar
      {
        ToolbarItem(placement: .cancellationAction)
        {
          Button("Avbryt")
          {
            dismiss()
          }
        }
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            onSave(draft)
            dismiss()
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
  RecipesEdit(
    draft: testRecipe,
    onSave: { _ in /* no-op i preview */ })
}
