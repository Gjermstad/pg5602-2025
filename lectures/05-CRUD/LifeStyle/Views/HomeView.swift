//
//  StartView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftUI

struct HomeView: View
{
  @State private var exercises: [Exercise] = [exercise1, exercise2, exercise3]
  @State private var showSheet: Bool = false
  
  var body: some View
  {
    NavigationStack
    {
      VStack
      {
        LogoView()
        
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
              
              VStack(alignment: .leading) {
                HStack {
                  Text(exercise.title).font(.title)
                  // Spacer brukes for å ta opp og fylle ut plassen, og gjør her at hvert item tar hele bredden i Hstacken
                  Spacer()
                }
                Text(exercise.notes).font(.title3)
              }
              .padding()
              .background(gradient)
              .cornerRadius(20)
            }
            // List Style Plain gjør at vi får en renere UI som passer bra når du skal vise lister med data
            .listStyle(.plain)
          }
        } // END Group
        
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
  HomeView()
}
