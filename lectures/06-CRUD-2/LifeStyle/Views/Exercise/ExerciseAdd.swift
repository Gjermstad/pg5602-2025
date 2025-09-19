//
//  AddExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 03/09/2025.
//

import SwiftUI

struct ExerciseAdd: View
{
  @Environment(\.dismiss) private var dismiss
  @Binding var exercises: [Exercise]
  
  @State private var title = ""
  @State private var notes = ""
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        TextField("Tittel", text: $title)
        TextField("Notater", text: $notes)
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
            let exercise = Exercise(title: title, notes: notes)
            
            // Legger til ellement i tabellen/array
            exercises.append(exercise)
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
  ExerciseAdd(exercises: .constant([exercise5]))
}


