//
//  ExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 30/08/2025.
//

import SwiftUI

struct ExerciseView: View
{
  @State private var exercises: [Exercise] = [exercise1, exercise2, exercise3, exercise4, exercise5]
  
  var body: some View
  {
    NavigationStack
    {
      Group
      {
        if exercises.isEmpty
        {
          EmptyView()
        }
        else
        {
          List($exercises)
          {
            $exercise in
            
            NavigationLink
            {
              ExerciseEdit(exercise: $exercise)
            }
            label:
            {
              ExerciseRow(exercise: $exercise)
            }
          }
          .listStyle(.plain)
        }
      }
      .navigationTitle("Trening")
      .toolbar
      {
        ToolbarItem(placement: .topBarTrailing)
        {
          NavigationLink
          {
            ExerciseAdd(exercises: $exercises)
          }
          label:
          {
            Image(systemName: "plus.circle.fill").font(.title)
          }
        }
      }
    }
  }
}

#Preview
{
  ExerciseView()
}
