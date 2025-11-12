//
//  BeaconApp.swift
//  Beacon
//
//  Created by Stig Højklint on 24/10/2025.
//

import SwiftUI

@main struct BeaconApp: App
{
  // 📦 Delt datakilde for steder, søkekriterier og API-håndtering.
  // Initialiseres én gang og beholdes av SwiftUI.
  @StateObject private var dataStore = GeoDataStore()
  
  var body: some Scene
  {
    WindowGroup
    {
      // ⚠️ Starter appen med MainView, og deler dataStore via miljøet.
      // Dette gjør det enkelt for underliggende views å lese og oppdatere data.
      MainView().environmentObject(dataStore)
    }
  }
}
