//
//  ContentView.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 07/10/2023.
//

import SwiftUI

struct MainView: View
{
  @AppStorage("isDarkMode") private var darkMode = false
  
  var body: some View
  {
    TabView
    {
      FlightView().tabItem
      {
        Label("Flyturer", systemImage: "airplane.departure")
      }
      
      ReportView().tabItem
      {
        Label("Rapporter", systemImage: "chart.bar.xaxis")
      }
      
      SettingView().tabItem
      {
        Label("Innstillinger", systemImage: "gearshape.fill")
      }
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
  }
}

#Preview
{
  MainView().modelContainer(for: [Flight.self])
}
