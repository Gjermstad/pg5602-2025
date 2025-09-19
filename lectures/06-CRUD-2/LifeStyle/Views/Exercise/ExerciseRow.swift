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
    HStack
    {
      VStack
      {
        Text(exercise.title.first!.uppercased())
          .font(.title2).fontWeight(.bold)
          .foregroundStyle(.white)
          .frame(width: 60, height: 60)
          .background(gradient)
          .clipShape(Circle())
      }
      
      VStack(alignment: .leading)
      {
        HStack
        {
          Text(exercise.title)
            .font(.title2)
            .fontWeight(.bold)
          // Spacer brukes for at Hstack skal ta opp hele bredden
          Spacer()
        }
        Text(exercise.notes)
      }
    }
    .cornerRadius(20)
    .swipeActions(edge: .leading, allowsFullSwipe: true)
    {
      
    }
  }
}

#Preview
{
  ExerciseRow(exercise: .constant(exercise5)).padding(20)
}
