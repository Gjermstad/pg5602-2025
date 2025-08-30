//
//  SettingsView.swift
//  leksjon1
//
//  Created by Kenneth Andre Bettum Gjermstad on 27/08/2025.
//

import SwiftUI

struct SettingsView: View
{
    var body: some View
    {
        // Vi legger NavigationStack rett under body
        NavigationStack
        {
            Form
            {
                Section("Mørk eller lys skjerm")
                {
                    
                }
                
                Section("Om Leksjon 1")
                {
                    Text(about)
                }
                
                // Tittel på en seksjon er valgfritt på seksjoner
                Section
                {
                    
                }
            }.navigationTitle("Innstillinger")
        }
    }
}

#Preview {
    SettingsView()
}
