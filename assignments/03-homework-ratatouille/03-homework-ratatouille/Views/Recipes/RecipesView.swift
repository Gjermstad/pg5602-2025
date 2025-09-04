//
//  RecipesView.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct RecipesView: View {
  @State private var recipes: [String] = ["Pizza", "Pasta", "Gelato"]
  
  
  var body: some View
  {
    NavigationStack
    {
      Group
      {
        if recipes.isEmpty
        {
          EmptyStateView(title: "Ingen matoppskrifter")
        }
        else
        {
          List($recipes, id: \.self)
          {
            $recipe in
            
            NavigationLink
            {
              RecipesEdit(recipe: $recipe)
            }
          label:
            {
              RecipesRow(recipe: recipe)
            }
          }
        }
      }
      .navigationTitle("Oppskrifter")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview
{
  RecipesView()
}
