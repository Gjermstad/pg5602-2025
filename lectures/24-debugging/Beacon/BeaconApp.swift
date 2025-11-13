//
// BeaconApp.swift
// Beacon
//

import SwiftUI

//
// Appens inngangspunkt
// Oppretter og beholder den delte datamodellen for hele appen.
//
@main struct BeaconApp: App
{
  // Delt datamodell for steder (liste, søk og API-håndtering)
  @StateObject private var placesModel = PlacesModel()
  
  var body: some Scene
  {
    WindowGroup
    {
      // Starter appen med MainView
      // Gjør både placesModel og detailModel tilgjengelige
      // for alle underliggende views via miljøet.
      MainView().environmentObject(placesModel)
    }
  }
}
