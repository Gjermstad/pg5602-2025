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
  // body beskriver hvordan brukergrensesnittet settes opp.
  // Her definerer vi hvilke "Scenes" (vinduer) appen skal ha.
  var body: some Scene
  {
    WindowGroup
    {
      // Hovedideen med .modelContainer er å gjøre det mulig å lagre objektene dine permanent. (Persistering)
      // Uten det ville alle endringer gå tapt når appen lukkes. Når du bruker .modelContainer kan alle @Query
      // og @ModelContext i Views automatisk bruke containeren for å hente, oppdatere og persistere dataene dine.
      MainView().modelContainer(for: [ExerciseModel.self])
      
      // for: sier vi skal lage en container for denne typen modeller. Det gjør koden lesbar.
      // Du ser tydelig at containeren gjelder Exercise-modeller.
      
      // Exercise er typen (klassen), ikke et objekt. Swift krever at vi bruker .self når vi refererer til
      // selve typen som en verdi. Så Exercise.self betyr: “typen Exercise som et verdimessig objekt”.
      // Uten .self ville Swift tro vi mente et instansobjekt av typen Exercise, ikke selve typen.
    }
  }
}
