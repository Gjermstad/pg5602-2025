//
//  ContentView.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct MainView: View {
  @AppStorage("darkMode") private var isDarkMode: Bool = false
  
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
            SettingsView(isDarkMode: $isDarkMode)
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
      .environment(\.colorScheme, isDarkMode ? .dark : .light)
    }
}

#Preview {
    MainView()
}
