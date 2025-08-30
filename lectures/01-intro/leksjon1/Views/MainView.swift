//
//  MainView.swift
//  leksjon1
//
//  Created by Kenneth Andre Bettum Gjermstad on 27/08/2025.
//

import SwiftUI

// Vi endrer ContentView til MainView for Stig mener det gir mer mening på hva View'et viser
struct MainView: View
{
    var body: some View
    {
        // TabView gir en tab navigation på bunnen av skjermen
        TabView
        {
            // Hver .tabItem lagt til et View lager en knapp i tab-menyen på bunnen
            HomeView().tabItem
            {
                Label("Hjem", systemImage: "house")
            }
            ProfileView().tabItem
            {
                Label("Profil", systemImage: "person")
            }
            SettingsView().tabItem
            {
                Label("Innstillinger", systemImage: "gear")
            }
        }
    }
}

// #Preview brukes for å kunne se en forhåndsvisning på siden mens du koder
#Preview
{
    MainView()
}
