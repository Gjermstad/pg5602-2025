//
//  AddExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 03/09/2025.
//

import SwiftUI

struct AddExerciseView: View
{
  @Binding var trening: [String]
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        Button("Legg til en økt")
        {
          trening.append("TEST")
        }
        .buttonStyle(.borderedProminent)
      }
      .navigationBarTitle("Ny treningsøkt")
      .navigationBarTitleDisplayMode(.inline)
    }
    .presentationDetents([.height(250), .medium])
    .presentationCornerRadius(25)
  }
}

#Preview
{
  AddExerciseView(trening: .constant(["abc","def"]))
}
