//
//  SettingsView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftUI

struct SettingsView: View
{
  // @AppStorage lagrer og henter en enkel verdi fra UserDefaults ved hjelp av en nøkkel.
  // Her brukes nøkkelen "darkmode" for å huske om mørk modus er slått på eller av.
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
            Text("Versjon: \(version)")
          }
        }
        
        Section
        {
          Text(settings)
        }
      }
      .navigationTitle("Innstillinger")
    }
  }
}

#Preview
{
  SettingsView()
}
