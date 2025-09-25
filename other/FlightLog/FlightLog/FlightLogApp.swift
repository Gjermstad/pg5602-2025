//
//  FlightLogApp.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 07/10/2023.
//

import SwiftData
import SwiftUI

@main struct FlightLogApp: App
{
  @State private var isSplash = true
  let container: ModelContainer
  
  init()
  {
    let config = ModelConfiguration(url: URL.documentsDirectory.appending(path: "flightlog.store"))
    
    do
    {
      container = try ModelContainer(for: Flight.self, configurations: config)
    }
    catch
    {
      fatalError("Beklager, kunne ikke åpne databasen.")
    }
  }
  
  var body: some Scene
  {
    WindowGroup
    {
      if isSplash
      {
        SplashView(splash: $isSplash)
      }
      else
      {
        MainView()
      }
    }
    .modelContainer(container)
  }
}
