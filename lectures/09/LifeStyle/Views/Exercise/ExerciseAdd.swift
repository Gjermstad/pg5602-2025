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
  @Query(filter: #Predicate<CategoryModel>{$0.trashBin == false},
         sort: \CategoryModel.title) var categories: [CategoryModel]
  
  // Dismiss gir tilgang til en funksjon fra SwiftUI sitt miljø som kan lukke
  // det gjeldende View. Du kaller bare dismiss() når du vil lukke visningen.
  @Environment(\.dismiss) private var dismiss
  
  @State private var title = ""
  @State private var notes = ""
  @State private var level = 0
  @State private var category: CategoryModel?
  
  var body: some View
  {
    // en annen måte å filtrere på om man ikke vil bruke #Predicate over
    let filtered = categories.filter{!$0.trashBin}
    
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
          Picker("Vanskelighetsgrad", selection: $level)
          {
            Text("Enkel").tag(0)
            Text("Middels").tag(1)
            Text("Høy").tag(2)
            Text("Ironman").tag(3)
          }
          .pickerStyle(.segmented)
        }
        
        Picker("Velg kategori", selection: $category)
        {
          Text("Ingen kategori").tag(CategoryModel?.none)
          ForEach(filtered)
          {
            category in Text(category.title).tag(CategoryModel?.some(category))
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
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            // Oppretter et nytt ellement
            let exercise = ExerciseModel()
            
            exercise.title = title
            exercise.notes = notes
            exercise.level = level
            
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


