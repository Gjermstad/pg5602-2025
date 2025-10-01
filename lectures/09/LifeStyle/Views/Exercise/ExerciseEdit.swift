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
  
  var exercise: Exercise
  
  @State private var title: String
  @State private var levelValue: Int
  @State private var notes: String
  
  // Custom initializer for ExerciseEdit
  // Den tar imot en Binding<Exercise>, altså en "peker" til et Exercise-objekt
  init(exercise: Exercise)
  {
      // Her bruker vi underscore fordi vi må sette opp selve property-wrapperen (@Binding)
      // '_exercise' refererer til wrapperen, mens 'exercise' uten underscore refererer til verdien.
    self.exercise = exercise
      
      // Setter opp en @State-variabel med en initialverdi.
      // Vi henter ut startverdien fra bindingen med '.wrappedValue'.
      // Når viewet starter, får 'title' altså samme verdi som exercise.title.
      _title = State(initialValue: exercise.title)
      
      // Samme for 'level' – initialiseres med verdien fra exercise.level
    _levelValue = State(initialValue: exercise.levelValue)
      
      // Og for 'notes' – initialiseres med verdien fra exercise.notes
      _notes = State(initialValue: exercise.notes)
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
        
        Picker("Vanskelighetsgrad", selection: $levelValue)
        {
          ForEach(Level.allCases)
          {
            level in
            Text(level.title).tag(level)
          }
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
            exercise.levelValue = levelValue
            exercise.notes = notes
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
