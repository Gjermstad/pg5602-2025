//
//  BreakingBadApp.swift
//  BreakingBad
//
//  Created by Stig Orla Sørli Højklint on 13/10/2025.
//

import SwiftUI
import SwiftData

@main struct BreakingBadApp: App
{
  var body: some Scene
  {
    WindowGroup
    {
      MainView().modelContainer(for: QuoteModel.self)
    }
  }
}
