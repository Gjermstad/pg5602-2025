//
//  StartView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftUI

struct HomeView: View
{
  // @EnvironmentObject brukes når et View skal hente en delt data-kilde
  // som er injisert høyere opp i hierarkiet.
  // Her betyr det at HomeView forventer å finne en ExerciseStore
  // som allerede er lagt inn i environment i MainView eller i appen.
  @EnvironmentObject var store: ExerciseStore
  
  @State private var showSheet = false
  
  var body: some View
  {
    NavigationStack
    {
      VStack
      {
        LogoView()
        
        Group
        {
          if store.exercises.isEmpty
          {
            EmptyView()
          }
          else
          {
            List(store.exercises)
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
              }
              .padding()
              .background(gradient)
              .cornerRadius(20)
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
          MenuView(isPresented: $showSheet)
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
  // Når vi tester HomeView i Preview, må vi manuelt legge til en ExerciseStore.
  // Dette etterligner hvordan appen gjør det i LifeStyleApp (via environmentObject).
  // Uten denne linjen får vi feilmelding fordi HomeView krever en store fra environment.
  HomeView().environmentObject(ExerciseStore())
}
