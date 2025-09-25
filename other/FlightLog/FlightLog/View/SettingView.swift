//
//  SettingView.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 08/10/2023.
//

import SwiftData
import SwiftUI

struct SettingView: View
{
  @AppStorage("isDarkMode") private var darkMode = false
  
  @State private var showAircraft = false
  @State private var showAirports = false
  @State private var showCategories = false
  @State private var showArchive = false
  
  @State private var path = ""
  
  var body: some View
  {
    NavigationStack
    {
      List
      {
        Button
        {
          showAircraft.toggle()
        }
        label:
        {
          Label("Redigere fly", systemImage: "airplane")
        }
        .fullScreenCover(isPresented: $showAircraft, content: AirplaneView.init)
        
        Button
        {
          showAirports.toggle()
        }
        label:
        {
          Label("Redigere flyplasser", systemImage: "house.and.flag")
        }
        .fullScreenCover(isPresented: $showAirports, content: AirportView.init)
        
        Button
        {
          showCategories.toggle()
        }
        label:
        {
          Label("Redigere kategorier", systemImage: "rectangle.3.group.bubble")
        }
        .fullScreenCover(isPresented: $showCategories, content: CategoryView.init)
        
        Section
        {
          Toggle(isOn: $darkMode)
          {
            Label("Aktiver mørk modus", systemImage: darkMode ? "moon.zzz": "moon.circle")
          }
        }
        
        Section
        {
          Button
          {
            showArchive.toggle()
          }
          label:
          {
            Label("Administrere arkiv", systemImage: "archivebox.fill")
          }
          .fullScreenCover(isPresented: $showArchive, content: ArchiveView.init)
        }
        
        Section
        {
          VStack(alignment: .leading)
          {
            Text("Utviklet av Stig Højklint").fontWeight(.bold)
            Text("stig@hojklint.no / +47 99 00 56 53")
            Text("Alle rettigheter © tilhører Guidance")
            Text("Versjon 3-11.23")
          }
        }
        
        Section
        {
          Button
          {
            if path.isEmpty
            {
              path = URL.documentsDirectory.path()
              print(path)
            }
            else
            {
              path = ""
            }
          }
          label:
          {
            Label(path.isEmpty ? "Vis database lokasjon" : "Skjul database lokasjon", systemImage: "square.stack.3d.up.fill")
          }
          
          if !path.isEmpty
          {
            Text(path)
          }
        }
      }
      .navigationTitle("Innstillinger")
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
  }
}

#Preview
{
  SettingView().modelContainer(for: Category.self)
}
