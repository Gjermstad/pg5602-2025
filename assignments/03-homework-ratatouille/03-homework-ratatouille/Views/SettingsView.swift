//
//  SettingsView.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct SettingsView: View {
  @Binding var isDarkMode: Bool
  
    var body: some View {
      NavigationStack {
        Form {
          Section {
            Toggle("Dark Mode", isOn: $isDarkMode)
          }
        }
        .navigationTitle("Innstillinger")
      }
    }
}

#Preview {
  SettingsView(isDarkMode: .constant(false))
}
