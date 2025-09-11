//
//  RecipesView.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct RecipesView: View {
  @State private var recipes: [Recipe] = [testRecipe]
  @State private var showSheet: Bool = false
  
  var body: some View
  {
    NavigationStack
    {
      Group
      {
        // Visning om ingen oppskrifter er lagret
        if recipes.isEmpty
        {
          EmptyStateView(title: "Ingen matoppskrifter")
        }
        else // Visninger om det er oppskrifter lagret
        {
          List($recipes)
          {
            $recipe in
            
            NavigationLink
            {
              RecipesDetails(recipe: $recipe)
            }
          label:
            {
              RecipesRow(recipe: $recipe)
            }
          }
        }
      }
      .navigationTitle("Oppskrifter")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            showSheet.toggle()
          }
        label:
          {
            Image(systemName: "plus.circle.fill").font(.title2).tint(.blue)
          }
        }
      }
      
      // Modal for RecipesAdd sitt vindu
      .sheet(isPresented: $showSheet) {
        RecipesAdd(recipes: $recipes)
      }
    } // End NavigationStack
  }
}

#Preview
{
  RecipesView()
}
