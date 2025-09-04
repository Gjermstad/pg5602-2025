//
//  AddExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 03/09/2025.
//

import SwiftUI

struct ExerciseAdd: View
{
  @State private var name: String = ""
  @Binding var exercises: [String]
  @Binding var showSheet: Bool
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        TextField("Navn på trening", text: $name)
      }
      .navigationBarTitle("Ny treningsøkt")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar
      {
        ToolbarItem(placement: .cancellationAction)
        {
          Button("Avbryt", role: .cancel)
          {
            showSheet.toggle()
          }
        }
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            exercises.append(name)
            name.removeAll()
          }
          .disabled(name.isEmpty)
        }
      }
    }
    .presentationDetents([.height(250), .medium])
    .presentationCornerRadius(25)
  }
}

#Preview
{
  // Vi bruker .constant for å kunne fake et parameter i minnet som gies til Preview
  ExerciseAdd(
    exercises: .constant(["abc","def"]),
    showSheet: .constant(true)
  )
}
