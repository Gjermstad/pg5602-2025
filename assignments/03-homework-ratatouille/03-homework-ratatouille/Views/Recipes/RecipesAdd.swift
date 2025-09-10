//
//  RecipesAdd.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct RecipesAdd: View {
  
  @Binding var recipes: [Recipe]
  @Binding var showSheet: Bool
  
  @State private var recipeName: String = ""
  @State private var ingress: String = ""
  @State private var notes: String = ""
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        TextField("Navn på oppskrift", text: $recipeName)
        TextField("Kort beskrivelse", text: $ingress)
        TextField("Notater om oppskriften", text: $notes)
      }
      .navigationTitle("Ny oppskrift")
      .navigationBarTitleDisplayMode(.inline)
      // Toolbar for å få lagre og avbryt-knapper
      .toolbar
      {
        // Avbryt-knappen
        ToolbarItem(placement: .cancellationAction)
        {
          Button("Avbryt", role: .cancel)
          {
            showSheet.toggle()
          }
        }
        // Lagre oppskrift-knapp
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            recipes.append(Recipe(recipeName: recipeName, ingress: ingress, notes: notes))
            showSheet.toggle()
          }
          .disabled(recipeName.isEmpty)
        }
      }
    }
    // Info rundt hvordan Sheet ser ut
    .presentationDetents([.height(250), .medium])
    .presentationCornerRadius(45)
  }
}

#Preview {
  RecipesAdd(recipes: .constant([testRecipe]), showSheet: .constant(true))
}

