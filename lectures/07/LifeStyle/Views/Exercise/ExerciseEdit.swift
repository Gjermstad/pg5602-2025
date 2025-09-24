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
  
  @Binding var exercise: Exercise
  @State private var title: String
  @State private var notes: String
  @State private var level: Level
  
  init(exercise: Binding<Exercise>)
  {
    _exercise = exercise
    _title = .init(initialValue: exercise.wrappedValue.title)
    _notes = .init(initialValue: exercise.wrappedValue.notes)
    _level = .init(initialValue: exercise.wrappedValue.level)
  }
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        TextField("Tittel", text: $title)
        Section("Notater")
        {
          TextEditor(text: $notes).frame(minHeight: 100)
        }
        
        Picker("Vansklighetsgrad", selection: $level)
        {
          ForEach(Level.allCases)
          {
            level in Text(level.title).tag(level)
          }
        }
        .pickerStyle(.segmented)
        
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
            exercise.notes = notes
            exercise.level = level
            dismiss()
          }
        }
      }
    }
//    .onAppear()
//    {
//      title = exercise.title
//      notes = exercise.notes
//      level = exercise.level
//    }
  }
}

#Preview
{
  ExerciseEdit(exercise: .constant(exercise4))
}
