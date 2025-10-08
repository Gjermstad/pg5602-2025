//
//  StartView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftData
import SwiftUI

struct HomeView: View
{
  // @Query brukes til å hente alle objekter av typen Exercise fra SwiftData sin modelContainer
  // Dette gjør at variabelen 'exercises' automatisk holder en oppdatert liste over alle Exercise-objekter
  // Listen oppdateres automatisk i UI når objekter blir lagt til, endret eller slettet
  @Query(sort: \ExerciseModel.title) private var exercises: [ExerciseModel]
  
  @State private var showSheet = false
  
  var body: some View
  {
    // Henter øvelser som IKKE er arkivert i søppelbøtta
    let filteredExercises = exercises.filter{!$0.trashbin}
    
    NavigationStack
    {
      VStack
      {
        LogoView()
        
        Group
        {
          if filteredExercises.isEmpty
          {
            EmptyView()
          }
          else
          {
            List(filteredExercises)
            {
              exercise in
              
              VStack(alignment: .leading)
              {
                HStack
                {
                  Text(exercise.title).font(.title)
                  Spacer()
                }
                
                Text(exercise.notes).font(.title3)
                
                // Viser kategorien til øvelsen som tekst i UI.
                // Exercise.category er en valgfri Category (Category?).
                // Vi prøver å hente tittel med exercise.category?.title.
                // Hvis exercise.category er nil (ingen kategori valgt), vises fallback-teksten "Ingen kategori".
                Text("Kategori: \(exercise.category?.title ?? "Ingen kategori")").font(.caption)
              }
              .padding()
              .background(gradient)
              .cornerRadius(10)
              .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
          }
        }
      }
      .toolbar
      {
        ToolbarItem(placement: .topBarLeading)
        {
          MenuView(showSheet: $showSheet)
        }
      }
      .sheet(isPresented: $showSheet)
      {
        SearchView()
      }
    }
  }
}

#Preview
{
  HomeView().modelContainer(for: [ExerciseModel.self])
}
