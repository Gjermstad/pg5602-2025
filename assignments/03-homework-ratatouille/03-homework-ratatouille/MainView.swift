//
//  ContentView.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct MainView: View {
  
    var body: some View {
      NavigationStack {
        TabView {
          Tab("Oppskrifter", systemImage: "fork.knife.circle.fill"){
            RecipesView()
          }
          Tab("Søk", systemImage: "magnifyingglass.circle.fill") {
            SearchView()
          }
          Tab("Innstillinger", systemImage: "gear") {
            SettingsView()
          }
        }
        .toolbar {
          ToolbarItem(placement: .principal) {
            Image("logo")
              .resizable()
              .scaledToFit()
              .frame(height: 55)
          }
        }
      }
    }
}

#Preview {
    MainView()
}
