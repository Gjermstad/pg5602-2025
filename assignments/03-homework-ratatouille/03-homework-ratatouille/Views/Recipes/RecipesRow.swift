//
//  RecipesRow.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct RecipesRow: View
{
  
  @State var recipe: String
  
  var body: some View
  {
    HStack
    {
      // Henter ut første bokstav i oppskriften
      let firstChar:Character = recipe[recipe.startIndex]
      Text(String(firstChar))
        .padding()
        .background(
          Circle()
            .stroke(.blue, lineWidth: 3)
            .frame(height: 60)
        )
      Text(recipe)
        .font(.largeTitle)
    }
  }
}

#Preview {
  RecipesRow(recipe: "Pizza")
}
