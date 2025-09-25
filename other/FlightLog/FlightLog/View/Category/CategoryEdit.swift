//
//  EditCategoryView.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 07/10/2023.
//

import SwiftUI

struct CategoryEdit: View
{
  var category: Category
  
  @AppStorage("isDarkMode") private var darkMode = false
  @Environment(\.dismiss) private var dismiss
  
  @State private var name = ""
  @State private var note = ""
  
  var body: some View
  {
    Form
    {
      TextField("Navn", text: $name)
      TextField("Notater", text: $note, axis: .vertical).lineLimit(2...4)
      
      Section
      {
        Text("Opprettet: \(category.create.formatted(date: .abbreviated, time: .standard))")
        Text("Sist endret: \(category.update.formatted(date: .abbreviated, time: .standard))")
      }
      .foregroundStyle(.secondary)
    }
    .onAppear
    {
      name = category.name
      note = category.note
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
        Text("Redigere kategori")
      }
      
      ToolbarItem(placement: .confirmationAction)
      {
        Button("Lagre")
        {
          category.name = name
          category.note = note
          category.update = Date.now
          
          dismiss()
        }
        .disabled(name.isEmpty)
      }
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
    .navigationBarBackButtonHidden()
  }
}
