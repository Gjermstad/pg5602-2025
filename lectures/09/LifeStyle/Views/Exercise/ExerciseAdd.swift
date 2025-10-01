//
//  AddExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 03/09/2025.
//

import SwiftData
import SwiftUI

struct ExerciseAdd: View
{
  // Henter SwiftData sin modelContext fra environmentet til dette Viewet
  // modelContext gir tilgang til persistering av objekter: legge til, oppdatere, slette
  // @Environment gjør at vi får verdien fra SwiftUI sitt miljø, uten å sende den manuelt gjennom alle Views
  @Environment(\.modelContext) private var store
  
  // @Query gjør at SwiftData automatisk henter data fra databasen.
  // Her henter vi alle Category-objektene, sortert etter tittel.
  // Resultatet lagres i variabelen 'categories' som en array av Category.
  @Query(sort: \Category.title) var categories: [Category]
  
  // Dismiss gir tilgang til en funksjon fra SwiftUI sitt miljø som kan lukke
  // det gjeldende View. Du kaller bare dismiss() når du vil lukke visningen.
  @Environment(\.dismiss) private var dismiss
  
  @State private var title = ""
  @State private var notes = ""
  @State private var levelValue = Level.easy.rawValue
  @State private var category: Category?
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        Section
        {
          TextField("Tittel", text: $title)
        }
        
        Section("Vanskelighetsgrad")
        {
          Picker("Vanskelighetsgrad", selection: $levelValue)
          {
            ForEach(Level.allCases)
            {
              level in
              Text(level.title).tag(level)
            }
          }
          .pickerStyle(.segmented)
        }
        
        Picker("Velg kategori", selection: $category)
        {
          Text("Ingen kategori").tag(Category?.none)
          ForEach(categories)
          {
            category in Text(category.title).tag(Category?.some(category))
          }
        }
        .pickerStyle(.menu)
        
        Section("Notater")
        {
          TextEditor(text: $notes)
            .frame(minHeight: 100)
        }
      }
      .navigationBarTitle("Ny 🏋️‍♀️")
      .toolbar
      {
        ToolbarItem(placement: .cancellationAction)
        {
          Button("Avbryt", role: .cancel)
          {
            dismiss()
          }
        }
        
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            // Oppretter et nytt ellement
            let exercise = Exercise()
            
            exercise.title = title
            exercise.notes = notes
            exercise.levelValue = levelValue
            
            // Legger til ellement i tabellen/array
            store.insert(exercise)
            dismiss()
          }
          .disabled(title.isEmpty)
        }
      }
    }
  }
}

#Preview
{
  ExerciseAdd()
}


