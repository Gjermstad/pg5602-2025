//
//  SettingsView.swift
//  LifeStyle
//
//  Created by Kenneth Andre Bettum Gjermstad on 28/08/2025.
//

import SwiftUI

struct SettingsView: View
{
   // Vi plasserer en lokal variabel for dette Viewet her på toppen, men utenfor body
   // @State fortelle at View'et skal oppdatere skjermbilde når det er en endring av darkMode
   // @AppStorage er en property wrapper som lagrer enkle data i en liten tekstfil
   // private før var gjør at variabelen kun er synelig i tilhørende View
   @AppStorage("isDarkMode") private var darkMode: Bool = false
   
   var body: some View
   {
      NavigationStack
      {
         Form
         {
            // Section kan være med eller uten tittel
            Section("Mørk eller lys modus")
            {
               // Det å sette $ forran variabelen darkMode kobler sammen istedenfor å gi en kopi av verdien
               // Knappen fungerer ikke i Preview for .enviroment mangler siden den ligger i MainView
               Toggle("Aktiver mørk modus", isOn: $darkMode)
            }
            
            Section("Copyright")
            {
               VStack(alignment: .leading) {
                  Text("Utviklet av " + developerName)
                     .fontWeight(.bold)
                  Text("E-post: \(developerEMail)")
                  Text("Mobil: +47 \(developerPhone)")
                  Text(developerRights)
               }
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
