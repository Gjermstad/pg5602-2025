//
//  AddExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 03/09/2025.
//

import SwiftUI

struct ExerciseAdd: View
{
  // Dismiss gr tilgang til en funksjon fra SwiftUI som gjør at du kan lukke gjeldende View. Du kaller bare dismiss() når du vil lukke visningen.
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
      .navigationBarTitle("Ny treningsøkt 🏋️‍♀️")
    }
    .toolbar
    {
      ToolbarItem(placement: .confirmationAction)
      {
        Button("Lagre")
        {
          // Legger til nytt element i arrayet med treningsøkter
          let newExercise = Exercise(title: title, notes: notes)
          exercises.append(newExercise)
          // Lukker View'et som er åpent
          dismiss()
        }
      }
      ToolbarItem(placement: .cancellationAction)
      {
        Button("Avbryt", role: .cancel)
        {
          dismiss()
        }
      }
    }
    .navigationBarBackButtonHidden()
  }
}

#Preview
{
  ExerciseAdd(exercises: .constant([exercise4, exercise5]))
}


