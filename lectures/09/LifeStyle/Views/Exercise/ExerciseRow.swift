//
//  ExerciseRow.swift
//  LifeStyle
//
//  Created by Stig Højklint on 08/09/2025.
//

import SwiftUI

struct ExerciseRow: View
{
  var exercise: Exercise
  
  var body: some View
  {
    VStack(alignment: .leading)
    {
      HStack
      {
        // Første bokstav i tittelen vises som en sirkel med gradient-bakgrunn.
        Text(exercise.title.first!.uppercased())
          .font(.title)
          .foregroundStyle(.white)
          .frame(width: 60, height: 60)
          .background(gradient)
          .clipShape(Circle())
        
        VStack(alignment: .leading)
        {
          Text(exercise.title).font(.title2)
          Text(exercise.notes)
        }
        
        Spacer()
        
        // Hvis øvelsen er merket som favoritt (starred = true),
        // vises en gul stjerne til høyre.
        if (exercise.starred)
        {
          Image(systemName: "star.fill")
            .font(.title)
            .foregroundColor(.yellow)
        }
      }
    }
    .swipeActions(edge: .leading, allowsFullSwipe: true)
    {
      // Sveip til venstre → merk som favoritt
      Button
      {
        exercise.starred.toggle()
      }
      label:
      {
        Image(systemName: "star.fill").tint(.yellow)
      }
    }
    .swipeActions(edge: .trailing, allowsFullSwipe: false)
    {
      // Sveip til høyre → arkiver
      Button
      {
        exercise.archive = true
      }
      label:
      {
        Image(systemName: "trash").tint(.red)
      }
    }
  }
}

#Preview
{
  ExerciseRow(exercise: exercise).padding(20)
}
