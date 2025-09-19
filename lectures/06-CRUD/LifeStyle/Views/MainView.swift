//
//  ContentView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftUI

struct MainView: View
{
  // @AppStorage er en property wrapper som er tett integrert med SwiftUI sin livssyklus og krever en
  // View-context for å fungere korrekt. Den er designet for å fungere inne i SwiftUI-visninger
  @AppStorage("darkmode") private var darkmode: Bool = false
  
  var body: some View
  {
    // Det er anbefalt at TabView er helt ytterst med en NavigationStack for hvert View. Dette gjør at du beholder plasseringen i hver Tab når du hopper mellom dem.
    TabView
    {
      // Første NavtigationStack er hva som blir første tab som vises når appen åpnes
      // TAB 1
      NavigationStack
      {
        HomeView()
      }
      .tabItem
      {
        Image(systemName: "house")
        Text("Hjem")
      }
      // TAB 2
      NavigationStack
      {
        ProgressView()
      }
      .tabItem
      {
        Image(systemName: "chart.line.uptrend.xyaxis")
        Text("Progresjon")
      }
      // TAB 3
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
  MainView()
}
