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
  @StateObject var store = ExerciseStore()
  
  var body: some Scene
  {
    WindowGroup
    {
      // ved å legge til environmentObject på hovedViewet til appen så ligger databasen rundt hele appen injisert
      MainView().environmentObject(store)
    }
  }
}
