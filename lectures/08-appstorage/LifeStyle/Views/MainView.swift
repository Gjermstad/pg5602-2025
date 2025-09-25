//
//  ContentView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftUI
import SwiftData

struct MainView: View
{
  // @AppStorage er en property wrapper som er tett integrert med SwiftUI sin livssyklus og krever en
  // View-context for å fungere korrekt. Den er designet for å fungere inne i SwiftUI-visninger
  @AppStorage("darkmode") private var darkmode: Bool = false
  
  var body: some View
  {
    TabView
    {
      NavigationStack
      {
        HomeView()
      }
      .tabItem
      {
        Image(systemName: "house")
        Text("Hjem")
      }
      
      NavigationStack
      {
        ProgressView()
      }
      .tabItem
      {
        Image(systemName: "chart.line.uptrend.xyaxis")
        Text("Progresjon")
      }
      
      NavigationStack
      {
        SettingsView()
      }
      .tabItem
      {
        Image(systemName: "gear")
        Text("Innstillinger")
      }
    }
    .environment(\.colorScheme, darkmode ? .dark : .light)
  }
}

#Preview
{
  MainView().modelContainer(for: [Exercise.self])
}
