//
//  LifeStyleApp.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftData
import SwiftUI

// Marker inngangspunktet til appen – her starter programmet
@main struct LifeStyleApp: App
{
  // SwiftData sin ModelContainer holder styr på alle modeller og håndterer lagring/persistens.
  let container: ModelContainer
  
  init()
  {
    // Oppretter en konfigurasjon for databasen.
    // Her spesifiserer vi URL til lagringsfilen, i dette tilfellet "LifeStyle.store" i dokumentkatalogen.
    let config = ModelConfiguration(url: URL.documentsDirectory.appending(path: "LifeStyle.store"))
    
    // I iOS ligger dokumentkatalogen (Documents directory) i appens sandkasse – altså et område som bare
    // appen selv har tilgang til. Den er ikke synlig for andre apper.
    // På en fysisk iPhone eller iPad: /var/mobile/Containers/Data/Application/<UUID>/Documents/
    // <UUID> er en unik identifikator for appens instans. Den endres hver gang appen installeres på nytt.
    
    do
    {
      // Forsøker å åpne eller opprette en ModelContainer med modellen Exercise og den spesifiserte konfigurasjonen.
      // ModelContainer fungerer som "hjernen" for SwiftData-modellene dine.
      container = try ModelContainer(for: ExerciseModel.self, CategoryModel.self, configurations: config)
    }
    catch
    {
      // Dersom noe går galt ved åpne eller opprettelse av databasen, stopper appen med en fatalError og skriver
      // ut en beskjed. Dette er nyttig under utvikling, men i produksjon bør man håndtere feilen mer elegant.
      fatalError("Feil ved åpning av databasen: \(error)")
    }
  }
   
  // body beskriver hvordan brukergrensesnittet settes opp. Her definerer vi hvilke "Scenes" (vinduer) appen skal ha.
  var body: some Scene
  {
    WindowGroup
    {
      // Hovedideen med .modelContainer er å gjøre det mulig å lagre objektene dine permanent. (Persistering)
      // Uten det ville alle endringer gå tapt når appen lukkes. Når du bruker .modelContainer kan alle @Query
      // og @ModelContext i Views automatisk bruke containeren for å hente, oppdatere og persistere dataene dine.
      MainView().modelContainer(container)
      
      // for: sier vi skal lage en container for denne typen modeller. Det gjør koden lesbar.
      // Du ser tydelig at containeren gjelder Exercise-modeller.
      
      // Exercise er typen (klassen), ikke et objekt. Swift krever at vi bruker .self når vi refererer til
      // selve typen som en verdi. Så Exercise.self betyr: “typen Exercise som et verdimessig objekt”.
      // Uten .self ville Swift tro vi mente et instansobjekt av typen Exercise, ikke selve typen.
    }
  }
}
