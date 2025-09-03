//
//  AddExerciseView.swift
//  LifeStyle
//
//  Created by Kenneth Andre Bettum Gjermstad on 03/09/2025.
//

import SwiftUI

struct AddExerciseView: View
{
   @Binding var exercises: [String]

    var body: some View
   {
        NavigationStack
       {
          Form
          {
             Button("Legg til en økt")
             {
                exercises.append("Test")
             }
             .buttonStyle(.borderedProminent)
          }
          .navigationTitle("Ny treningsøkt")
          .navigationBarTitleDisplayMode(.inline)
       }
       // presentationDetents setter høyden når brukt som sheet, med to verdier setter du at høyden kan være mellom min og maks
       .presentationDetents([.height(250), .medium])
       .presentationCornerRadius(20)
    }
}

#Preview {
   AddExerciseView(exercises: .constant(["String"]))
}
