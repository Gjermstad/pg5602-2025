//
//  LifeStyleApp.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftData
import SwiftUI

// Marker inngangspunktet til appen – her starter programmet
@main

struct LifeStyleApp: App
{
  let container: ModelContainer
  let url: URL
  
  init()
  {
    url = URL.documentsDirectory.appending(path: "LifeStyle.sqlite")
    let config = ModelConfiguration(url: url)
    
    do
    {
     container = try ModelContainer(for: ExerciseModel.self, configurations: config)
    }
    catch
    {
      fatalError("Kan ikke åpne databasefil: \(error)")
    }
    
  }
  
  // body beskriver hvordan brukergrensesnittet settes opp.
  // Her definerer vi hvilke "Scenes" (vinduer) appen skal ha.
  var body: some Scene
  {
    WindowGroup
    {
      // Hovedideen med .modelContainer er å gjøre det mulig å lagre objektene dine permanent. (Persistering)
      // Uten det ville alle endringer gå tapt når appen lukkes. Når du bruker .modelContainer kan alle @Query
      // og @ModelContext i Views automatisk bruke containeren for å hente, oppdatere og persistere dataene dine.
      MainView().modelContainer(container)
    }
  }
}
