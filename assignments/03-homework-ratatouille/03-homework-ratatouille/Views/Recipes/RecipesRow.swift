//
//  RecipesRow.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct RecipesRow: View
{
  
  @Binding var recipe: Recipe
  
  var body: some View
  {
    HStack
    {
      // Henter ut første bokstav i oppskriften
      Text(recipe.recipeName.first!.uppercased())
        .font(.title).foregroundStyle(.white)
        .frame(width: 60, height: 60)
        .background(Gradient(colors: [.blue, .purple]))
        .clipShape(.circle)
      
      VStack(alignment: .leading) {
        Text(recipe.recipeName)
          .font(.largeTitle)
        Text(recipe.ingress)
          .font(.subheadline)
      }
    }
  }
}

#Preview {
  RecipesRow(recipe: .constant(testRecipe))
}
