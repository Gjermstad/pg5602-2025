//
//  ContentView.swift
//  LifeStyle
//
//  Created by Kenneth Andre Bettum Gjermstad on 28/08/2025.
//

import SwiftUI

struct MainView: View
{
   // Vi plasserer en lokal variabel for dette Viewet her på toppen, men utenfor body
   // @State fortelle at View'et skal oppdatere skjermbilde når det er en endring av darkMode
   // @AppStorage er en property wrapper som lagrer enkle data i en liten tekstfil
   // private før var gjør at variabelen kun er synelig i tilhørende View
   @AppStorage("isDarkMode") private var darkMode: Bool = false
   
   var body: some View
   {
      NavigationStack
      {
         // TabView gir oss tab navigasjon på bunnen i faner
         TabView
         {
            // Du kan fylle ut info om tab'en med Label eller Image + Text, resultatet er det samme
            StartView().tabItem
            {
               // Fremgangsmåte 1
               Label("Start", systemImage: "house")
            }
            ProfileView().tabItem
            {
               Label("Profil", systemImage: "person")
            }
            SettingsView().tabItem
            {
               // Fremgangsmåte 2
               Image(systemName: "gear")
               Text("Innstillinger")
            }
         }
         // toolbar brukes for å få opp logoen på toppen
         .toolbar
         {
            // Plasserer logoen på toppen, .principal setter den i midten
            ToolbarItem(placement: .principal)
            {
               Image("Logo")
                  .resizable()
                  .scaledToFit()
                  .frame(height: 55)
            }
            
            // placement: .topBarTrailing plasserer menyen på høyre side
            ToolbarItem(placement: .topBarTrailing)
            {
               // Menu setter opp en drawer meny
               Menu
               {
                  // Hver NavigationLink lager et valg/knapp i Drawer menyen
                  NavigationLink(destination: ProfileView())
                  {
                     Label("🏋️‍♀️ Trening", systemImage: "figure.walk")
                  }
                  NavigationLink(destination: NutritionView())
                  {
                     Label("🥗 Kosthold", systemImage: "leaf")
                  }
                  NavigationLink(destination: ProfileView())
                  {
                     Label("🧘‍♂️ Velvære", systemImage: "heart")
                  }
                  NavigationLink(destination: ProfileView())
                  {
                     Label("🎯 Mål", systemImage: "target")
                  }
               }
               // label brukes for meny i øvre høyre hjørne
            label:
               {
                  // line.3.horizontal = hamburgermeny
                  // ellipsis = meny med ...
                  // ellipsis.circle legger sirkel rundt ...
                  Image(systemName: "ellipsis.circle").font(.title2)
               }
            }
         }
      }
      // Vi begynner med \ når vi skal påvirke enviroment (miljø)
      .environment(\.colorScheme, darkMode ? .dark : .light)
   }
}

#Preview {
   MainView()
}
