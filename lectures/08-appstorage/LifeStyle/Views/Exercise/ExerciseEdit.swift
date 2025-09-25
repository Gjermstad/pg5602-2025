//
//  ExerciseEdit.swift
//  LifeStyle
//
//  Created by Stig Højklint on 08/09/2025.
//

import SwiftUI
import SwiftData

struct ExerciseEdit: View
{
  // Dismiss gir tilgang til en funksjon fra SwiftUI sitt miljø som kan lukke
  // det gjeldende View. Du kaller bare dismiss() når du vil lukke visningen.
  @Environment(\.dismiss) private var dismiss
  
  var exercise: Exercise
  
  @State private var title: String
  @State private var notes: String
  
  init(exercise: Exercise)
  {
    self.exercise = exercise
    _title = .init(initialValue: exercise.title)
    _notes = .init(initialValue: exercise.notes)
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
          TextEditor(text: $notes).frame(minHeight: 150)
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
  ExerciseEdit()
}
