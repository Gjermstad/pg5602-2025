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
  @Query(sort: \ExerciseModel.title) private var exercises: [ExerciseModel]
  
  var body: some View
  {
    // Oppretter en ny liste som kun inneholder de øvelsene som IKKE er lagt i søppelbøtta.
    let filteredExercises = exercises.filter{ !$0.trashbin }
    
    NavigationStack
    {
      Group
      {
        if filteredExercises.isEmpty
        {
          EmptyView()
        }
        else
        {
          List
          {
            MessageView(text: "Sveip mot høyre for å favorisere en øvelse, og mot venstre for å sende den til søppelbøtta.")
              .listRowSeparator(.hidden)
            
            ForEach(filteredExercises)
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
  ExerciseView()
}
