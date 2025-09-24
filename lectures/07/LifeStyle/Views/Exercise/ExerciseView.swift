//
//  ExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 30/08/2025.
//

import SwiftUI

struct ExerciseView: View
{
  // @EnvironmentObject brukes når et View skal hente en delt data-kilde
  // som er injisert høyere opp i hierarkiet.
  // Her betyr det at HomeView forventer å finne en ExerciseStore
  // som allerede er lagt inn i environment i MainView eller i appen.
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
  // Når vi tester ExerciseView i Preview, må vi manuelt legge til en ExerciseStore.
  // Dette etterligner hvordan appen gjør det i LifeStyleApp (via environmentObject).
  // Uten denne linjen får vi feilmelding fordi ExerciseView krever en store fra environment.
  ExerciseView().environmentObject(ExerciseStore())
}
