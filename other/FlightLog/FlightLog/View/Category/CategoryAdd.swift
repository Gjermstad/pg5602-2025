//
//  CategoryAdd.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 13/10/2023.
//

import SwiftUI

struct CategoryAdd: View
{
  @AppStorage("isDarkMode") private var darkMode = false
  @Environment(\.dismiss) private var dismiss
  
  @Environment(\.modelContext) private var context
  
  @State private var name = ""
  @State private var note = ""
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        TextField("Navn", text: $name)
        TextField("Notater", text: $note, axis: .vertical).lineLimit(2...4)
      }
      .toolbar
      {
        ToolbarItem(placement: .cancellationAction)
        {
          Button("Avbryt", role: .cancel)
          {
            dismiss()
          }
        }
        
        ToolbarItem(placement: .principal)
        {
          Text("Ny kategori")
        }
        
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            let category = Category(name: name, note: note)
            
            context.insert(category)
            dismiss()
          }
          .disabled(name.isEmpty)
        }
      }
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
    .presentationDetents([.height(250), .medium])
    .presentationCornerRadius(20)
  }
}

#Preview 
{
  CategoryAdd()
}
