//
//  LifeStyleApp.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftUI

// Marker inngangspunktet til appen – her starter programmet
@main

struct LifeStyleApp: App
{
  // Oppretter en "store" som holder på alle data om øvelser.
  // @StateObject brukes fordi vi ønsker at denne instansen skal leve
  // så lenge appen kjører, og at den skal reagere på endringer.
  @StateObject private var store = ExerciseStore()
  
  // body beskriver hvordan brukergrensesnittet settes opp.
  // Her definerer vi hvilke "Scenes" (vinduer) appen skal ha.
  var body: some Scene
  {
    WindowGroup
    {
      // Starter med å vise MainView, som er hovedskjermen.
      // Vi sender også med "store" til alle underliggende Views
      // ved å legge det i .environmentObject(store).
      MainView().environmentObject(store)
    }
  }
}
