//
//  ExerciseRow.swift
//  LifeStyle
//
//  Created by Stig Højklint on 08/09/2025.
//

import SwiftUI

struct ExerciseRow: View
{
  @Binding var exercise: Exercise
  
  var body: some View
  {
    VStack(alignment: .leading)
    {
      HStack
      {
        Text(exercise.title)
        Spacer()
      }
        
      Text(exercise.notes)
    }
    .padding()
    .background(gradient)
    .cornerRadius(20)
  }
}

#Preview
{
  ExerciseRow(exercise: .constant(exercise5)).padding(20)
}
