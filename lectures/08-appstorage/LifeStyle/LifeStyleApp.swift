//
//  LifeStyleApp.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftUI
import SwiftData

// Marker inngangspunktet til appen – her starter programmet
@main

struct LifeStyleApp: App
{
  // body beskriver hvordan brukergrensesnittet settes opp.
  // Her definerer vi hvilke "Scenes" (vinduer) appen skal ha.
  var body: some Scene
  {
    WindowGroup
    {
      // Om vi har flere tabeller som er relasjonstabeller så trenger man ikke å legge til alle
      MainView().modelContainer(for: [Exercise.self])
    }
  }
}
