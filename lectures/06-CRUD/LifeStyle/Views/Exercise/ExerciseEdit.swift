//
//  ExerciseEdit.swift
//  LifeStyle
//
//  Created by Stig Højklint on 08/09/2025.
//

import SwiftUI

struct ExerciseEdit: View
{
  @Binding var exercise: Exercise
  @State private var title: String = ""
  @State private var notes: String = ""
  
  // Dismiss gr tilgang til en funksjon fra SwiftUI som gjør at du kan lukke gjeldende View. Du kaller bare dismiss() når du vil lukke visningen.
  @Environment(\.dismiss) private var dismiss
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        TextField("Tittel", text: $title)
        TextField("Notater", text: $notes)
      }
      .navigationBarTitle("Redigere 🏋️‍♀️")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar
      {
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            exercise.title = title
            exercise.notes = notes
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
    // onAppear er kode som kjører før View vises på skjermen
    .onAppear()
    {
      title = exercise.title
      notes = exercise.notes
    }
  }
}

#Preview
{
  ExerciseEdit(exercise: .constant(exercise4))
}
