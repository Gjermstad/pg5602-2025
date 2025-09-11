//
//  RecipesDetails.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 11/09/2025.
//

import SwiftUI

struct RecipesDetails: View
{
  @Binding var recipe: Recipe
  @State private var isEditing: Bool = false
  
  var body: some View
  {
    VStack
    {
      Text("Oppskriftsdetaljer")
      Form
      {
        Section()
        {
          VStack(alignment: .leading) {
            Text("Navn")
              .font(.caption)
              .foregroundStyle(.secondary)
            Text(recipe.recipeName)
          }
          VStack(alignment: .leading) {
            Text("Kort beskrivelse")
              .font(.caption)
              .foregroundStyle(.secondary)
            Text(recipe.ingress)
          }
          
        }
        Section(header: Text("Notater"))
        {
          Text(recipe.notes)
        }
        // Informasjon om når oppskriften er lagt til
        Section(footer:
                  Text("Lagt til: \(recipe.created.formatted(date: .long, time: .omitted)) kl. \(recipe.created.formatted(date: .omitted, time: .shortened))")
          .foregroundStyle(.secondary)
        ) {}
        // Viser linje om når oppskriften ble sist endret (om den har blitt endret etter at oppskriften ble lagt til første gangen
        if(recipe.created != recipe.lastEdited) {
          Section(footer:
                    Text("Lagt til: \(recipe.lastEdited.formatted(date: .abbreviated, time: .standard))")
            .foregroundStyle(.secondary)
          ) {}
        }
      }
      .toolbar // til Form
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
      
      // Modal for RecipesAdd sitt vindu
      .sheet(isPresented: $isEditing) {
        RecipesEdit(draft: recipe) { updated in
          recipe = updated
        }
      }
      
    } // End Vstack
  }
}

#Preview {
  RecipesDetails(recipe: .constant(testRecipe))
}
