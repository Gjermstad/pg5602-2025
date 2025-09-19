//
//  StartView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftUI

struct HomeView: View
{
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
  HomeView().environmentObject(ExerciseStore())
}
