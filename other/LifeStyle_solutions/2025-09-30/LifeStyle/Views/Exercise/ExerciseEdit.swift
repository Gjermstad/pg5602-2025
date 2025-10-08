//
//  ExerciseEdit.swift
//  LifeStyle
//
//  Created by Stig Højklint on 08/09/2025.
//

import SwiftData
import SwiftUI

struct ExerciseEdit: View
{
  // Dismiss gir tilgang til en funksjon fra SwiftUI sitt miljø som kan lukke
  // det gjeldende View. Du kaller bare dismiss() når du vil lukke visningen.
  @Environment(\.dismiss) private var dismiss
  
  // Henter SwiftData sin modelContext fra environmentet til dette Viewet
  // modelContext gir tilgang til persistering av objekter: legge til, oppdatere, slette
  // @Environment gjør at vi får verdien fra SwiftUI sitt miljø, uten å sende den manuelt gjennom alle Views
  @Environment(\.modelContext) private var context
  
  // @Query gjør at SwiftData automatisk henter data fra databasen.
  // Her henter vi alle Category-objektene, sortert etter tittel.
  // Resultatet lagres i variabelen 'categories' som en array av Category.
  @Query(sort: \CategoryModel.title) var categories: [CategoryModel]
  
  var exercise: ExerciseModel
  
  @State private var title: String
  @State private var notes: String
  @State private var level: Int
  @State private var category: CategoryModel?
  
  init(exercise: ExerciseModel)
  {
    self.exercise = exercise
    
    // Setter startverdier til @State-variablene.
    // @State variabler trenger alltid en initialverdi.
    _title = State(initialValue: exercise.title)
    _notes = State(initialValue: exercise.notes)
    _level = State(initialValue: exercise.level)
    _category = State(initialValue: exercise.category)
  }
  
  var body: some View
  {
    // Henter kategorier som IKKE er arkivert i søppelbøtta
    let filteredCategories = categories.filter{ !$0.trashbin }
    
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
          TextEditor(text: $notes).frame(minHeight: 200)
        }
        
        Section
        {
          Text("Opprettet: \(exercise.create.formatted(date: .abbreviated, time: .standard))")
          Text("Sist endret: \(exercise.update.formatted(date: .abbreviated, time: .standard))")
        }
        .foregroundStyle(.secondary)
      }
      .navigationBarTitle("Redigere ✏️")
      .toolbar
      {
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            exercise.title = title
            exercise.notes = notes
            exercise.level = level
            exercise.category = category
            exercise.update = .now
            
            dismiss()
          }
        }
      }
    }
  }
}

#Preview
{
  ExerciseEdit(exercise: exercise)
}
