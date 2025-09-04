//
//  RecipesView.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct RecipesView: View {
  @State private var recipes: [String] = []
  // ["Pizza", "Pasta", "Gelato"]
  
  
    var body: some View {
      if (recipes.isEmpty) {
        EmptyView(title: "Ingen matoppskrifter")
      } else {
        NavigationStack {
          
        }
      }
    }
}

#Preview {
    RecipesView()
}
