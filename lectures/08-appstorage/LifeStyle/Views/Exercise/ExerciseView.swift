//
//  ExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 30/08/2025.
//

import SwiftUI
import SwiftData

struct ExerciseView: View
{
  @Query private var exercises: [Exercise]
  
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
          List(exercises)
          {
            exercise in
            
            NavigationLink
            {
              ExerciseEdit(exercise: exercise)
            }
            label:
            {
              ExerciseRow(exercise: exercise)
            }
            .listRowSeparator(.hidden)
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
            ExerciseAdd()
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
  ExerciseView().modelContainer(for: [Exercise.self])
}
