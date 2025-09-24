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
  // Selv om MainView ikke bruker ExerciseStore direkte, trenger HomeView det.
  // Derfor må vi "late som" at PreView er appen og injisere et environmentObject
  // slik som vi gjorde med MainView i LifeStyleApp

  MainView().environmentObject(ExerciseStore())
}
