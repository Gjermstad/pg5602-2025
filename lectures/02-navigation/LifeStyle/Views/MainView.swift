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
        // TabView gir oss tab navigasjon på bunnen
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
        // Vi begynner med \ når vi skal påvirke enviroment (miljø)
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}

#Preview {
    MainView()
}
