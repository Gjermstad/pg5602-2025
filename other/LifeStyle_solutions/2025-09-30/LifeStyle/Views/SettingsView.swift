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
  
  @State private var path = ""
  
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
        
        NavigationLink(destination: CategoryView())
        {
          Label("Kategorier", systemImage: "tray.2.fill")
        }
        
        NavigationLink(destination: CategoryTrash())
        {
          Label("Arkiverte kategorier", systemImage: "trash.fill")
        }
        
        NavigationLink(destination: ExerciseTrash())
        {
          Label("Arkiverte øvelser", systemImage: "trash.fill")
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
          Button
          {
            // Sjekker om path-variabelen er tom
            if path.isEmpty
            {
              // Hvis tom: hent filstien til dokumentmappen og lagre i path
              path = URL.documentsDirectory.path()
              print(path) // Skriver ut stien til Xcode-debug-konsollen
            }
            else
            {
              // Hvis path allerede har verdi: "tøm" den (slik at teksten skjules)
              path = ""
            }
          }
          label:
          {
            Label(path.isEmpty ? "Vis database lokasjon" : "Skjul database lokasjon", systemImage: "square.stack.3d.up.fill")
          }
          
          // Viser stien som tekst under knappen, men bare hvis path har verdi
          if !path.isEmpty
          {
            Text(path)
            
            Button
            {
              // Kopierer innholdet av variabelen til systemets utklippstavle,
              // slik at brukeren kan lime det inn i andre apper.
              UIPasteboard.general.string = path
            }
            label:
            {
              Label("Kopier til utklippstavle", systemImage: "document.on.document.fill")
            }
          }
        }
      }
      .navigationTitle("Innstillinger")
    }
  }
}

#Preview
{
  SettingsView().modelContainer(for: [ExerciseModel.self])
}
