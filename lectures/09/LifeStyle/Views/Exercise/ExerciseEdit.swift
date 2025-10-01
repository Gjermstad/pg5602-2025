//
//  ExerciseEdit.swift
//  LifeStyle
//
//  Created by Stig Højklint on 08/09/2025.
//

import SwiftUI

struct ExerciseEdit: View
{
  // Dismiss gir tilgang til en funksjon fra SwiftUI sitt miljø som kan lukke
  // det gjeldende View. Du kaller bare dismiss() når du vil lukke visningen.
  @Environment(\.dismiss) private var dismiss
  
  var exercise: ExerciseModel
  
  @State private var title: String
  @State private var level: Int
  @State private var notes: String
  @State private var category: CategoryModel?
  
  // Custom initializer for ExerciseEdit
  // Den tar imot en Binding<Exercise>, altså en "peker" til et Exercise-objekt
  init(exercise: ExerciseModel)
  {
    // Her bruker vi underscore fordi vi må sette opp selve property-wrapperen (@Binding)
    // '_exercise' refererer til wrapperen, mens 'exercise' uten underscore refererer til verdien.
    self.exercise = exercise
    
    // Setter opp en @State-variabel med en initialverdi.
    // Vi henter ut startverdien fra bindingen med '.wrappedValue'.
    // Når viewet starter, får 'title' altså samme verdi som exercise.title.
    _title = State(initialValue: exercise.title)
    _level = State(initialValue: exercise.level)
    _notes = State(initialValue: exercise.notes)
    _category = State(initialValue: exercise.category)
  }
  
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
        
        Picker("Vanskelighetsgrad", selection: $level)
        {
          Text("Enkel").tag(0)
          Text("Middels").tag(1)
          Text("Høy").tag(2)
          Text("Ironman").tag(3)
        }
        .pickerStyle(.segmented)
        
        Section("Notater")
        {
          TextEditor(text: $notes)
            .frame(minHeight: 100)
        }
      }
      .navigationBarTitle("Redigere 🏋️‍♀️")
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden()
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
            exercise.title = title
            exercise.level = level
            exercise.notes = notes
            exercise.category = category
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
