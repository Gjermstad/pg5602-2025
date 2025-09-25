//
//  ReportView.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 11/10/2023.
//

import SwiftUI

struct ReportView: View
{
  @AppStorage("isDarkMode") private var darkMode = false
  
  var body: some View
  {
    NavigationStack
    {
      List
      {
      }
      .navigationTitle("Rapporter")
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
  }
}

#Preview 
{
  ReportView()
}
