//
//  ContentView.swift
//  BreakingBad
//
//  Created by Stig Orla Sørli Højklint on 13/10/2025.
//

import SwiftUI
import SwiftData

struct MainView: View
{
  var body: some View
  {
    TabView
    {
      JsonView().tabItem
      {
        Label("Json", systemImage: "icloud.fill")
      }
      
      DataView().tabItem
      {
        Label("Lagret", systemImage: "opticaldiscdrive.fill")
      }
    }
  }
}

#Preview
{
  MainView().modelContainer(for: QuoteModel.self)
}
