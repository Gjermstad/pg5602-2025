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
  @Environment(\.modelContext) private var context
  
  // Dismiss gir tilgang til en funksjon fra SwiftUI sitt miljø som kan lukke
  // det gjeldende View. Du kaller bare dismiss() når du vil lukke visningen.
  @Environment(\.dismiss) private var dismiss
  
  // @Query gjør at SwiftData automatisk henter data fra databasen.
  // Her henter vi alle Category-objektene, sortert etter tittel.
  // Resultatet lagres i variabelen 'categories' som en array av Category.
  @Query(sort: \CategoryModel.title) private var categories: [CategoryModel]
  
  @State private var title = ""
  @State private var notes = ""
  @State private var level = 0
  @State private var category: CategoryModel?
  
  var body: some View
  {
    NavigationStack
    {
      // Henter kategorier som IKKE er arkivert i søppelbøtta
      let filteredCategories = categories.filter{!$0.trashbin}
      
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
            Text("Lav").tag(0)
            Text("Middels").tag(1)
            Text("Høy").tag(2)
          }
        }
        .pickerStyle(.segmented)
        
        Picker("Velg kategori", selection: $category)
        {
          Text("Ingen kategori").tag(CategoryModel?.none)
          ForEach(filteredCategories)
          {
            category in Text(category.title).tag(CategoryModel?.some(category))
          }
        }
        .pickerStyle(.menu)
        
        Section("Notater")
        {
          TextEditor(text: $notes).frame(minHeight: 100)
        }
      }
      .navigationBarTitle("Ny ✏️")
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
            exercise.category = category
            
            // Legger til ellement i tabellen/array
            context.insert(exercise)
            
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
