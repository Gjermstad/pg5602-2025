//
//  ExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 30/08/2025.
//

import SwiftData
import SwiftUI

struct ExerciseView: View
{
  // @Query brukes til å hente alle objekter av typen Exercise fra SwiftData sin modelContainer
  // Dette gjør at variabelen 'store' automatisk holder en oppdatert liste over alle Exercise-objekter
  // Listen oppdateres automatisk i UI når objekter blir lagt til, endret eller slettet
  // private gjør at listen kun kan brukes innenfor dette Viewet
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
