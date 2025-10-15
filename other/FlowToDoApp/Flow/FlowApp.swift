//
//  FlowApp.swift
//  Flow
//
//  Created by Stig Højklint on 29/09/2025.
//

import SwiftData
import SwiftUI

@main struct FlowApp: App
{
  let container: ModelContainer
  
  init()
  {
    let url = URL.documentsDirectory.appending(path: "Flow.sqlite")
    let config = ModelConfiguration(url: url)
    
    do
    {
      container = try ModelContainer(for: TaskModel.self, configurations: config)
    }
    catch
    {
      fatalError("Beklager feil ved databasen: \(error)")
    }
  }
  
  var body: some Scene
  {
    WindowGroup
    {
      MainView().modelContainer(container)
    }
  }
}
