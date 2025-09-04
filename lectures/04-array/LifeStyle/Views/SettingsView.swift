//
//  SettingsView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftUI

struct SettingsView: View
{
  // AppStorage er en property wrapper som lagrer enkle data i UserDefaults
  @AppStorage("darkmode") private var darkmode = false
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        Section("Mørk eller lys modus")
        {
          Toggle("Aktiver mørk modus", systemImage: darkmode ? "moon.zzz" : "moon.circle", isOn: $darkmode)
        }
        
        Section
        {
          VStack(alignment: .leading)
          {
            Text("Utviklet av Stig Højklint").fontWeight(.bold)
            Text("stig@hojklint.no / +47 99 00 56 53")
            Text("Alle rettigheter © tilhører Guidance")
            Text("Versjon 25-08.25")
          }
        }
        
        Section("SwiftUI")
        {
          Text(swift)
        }
      }
      .navigationTitle("Innstillinger")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview
{
  SettingsView()
}
