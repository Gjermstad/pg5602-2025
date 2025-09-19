//
//  ExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 30/08/2025.
//

import SwiftUI

struct ExerciseView: View
{
  @EnvironmentObject var store: ExerciseStore
  
  var body: some View
  {
    NavigationStack
    {
      Group
      {
        if store.exercises.isEmpty
        {
          EmptyView()
        }
        else
        {
          List($store.exercises)
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
            ExerciseAdd(exercises: $store.exercises)
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
  ExerciseView().environmentObject(ExerciseStore())
}
