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
      HStack{
        Text(exercise.title)
          .fontWeight(.bold)
        Spacer()
      }
      
      Text(exercise.notes)
    }
    .padding(25)
    .background(gradient)
    .cornerRadius(25)
  }
}

#Preview
{
  ExerciseRow(exercise: .constant(exercise4)).padding(20)
}
