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
    NavigationStack
    {
      TabView
      {
        StartView().tabItem
        {
          Image(systemName: "house")
          Text("Start")
        }
        
        ProfileView().tabItem
        {
          Image(systemName: "person")
          Text("Profil")
        }
        
        SettingsView().tabItem
        {
          Image(systemName: "gear")
          Text("Innstillinger")
        }
      }
      .toolbar
      {
        ToolbarItem(placement: .principal)
        {
          Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(height: 50)
        }
        
        ToolbarItem(placement: .topBarTrailing)
        {
          Menu
          {
            NavigationLink(destination: ExerciseView())
            {
              Label("🏋️‍♀️ Trening", systemImage: "figure.walk")
            }
            
            NavigationLink(destination: NutritionView())
            {
              Label("🥗 Kosthold", systemImage: "leaf")
            }
          }
          label:
          {
            Image(systemName: "ellipsis.circle").font(.title2)
          }
        }
      }
    }
    .environment(\.colorScheme, darkmode ? .dark : .light)
  }
}

#Preview
{
  MainView()
}
