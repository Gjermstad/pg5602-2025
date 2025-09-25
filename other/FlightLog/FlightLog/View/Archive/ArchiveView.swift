//
//  ArchiveView.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 17/10/2023.
//

import SwiftData
import SwiftUI

struct ArchiveView: View
{
  @AppStorage("isDarkMode") private var darkMode = false
  @Environment(\.dismiss) private var dismiss
  
  var body: some View
  {
    NavigationStack
    {
      List
      {
        Section("Fly")
        {
          ArchiveAirplane()
        }
        
        Section("Flyplasser")
        {
          ArchiveAirport()
        }
        
        Section("Kategorier")
        {
          ArchiveCategory()
        }
        
        Section("Flyginger")
        {
          ArchiveFlight()
        }
      }
      .toolbar
      {
        ToolbarItem(placement: .topBarLeading)
        {
          Button()
          {
            dismiss()
          }
          label:
          {
            Image(systemName: "chevron.backward")
            Text("Tilbake")
          }
        }
      }
      .navigationTitle("Arkiv")
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
  }
}

#Preview
{
  ArchiveView().modelContainer(for: Flight.self)
}
