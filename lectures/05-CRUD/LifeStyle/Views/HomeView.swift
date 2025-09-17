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
              
              Text(exercise.title).font(.title)
              Text(exercise.notes).font(.title3)
            }
            .listStyle(.plain)
          }
        }
        .toolbar
        {
          ToolbarItem(placement: .topBarLeading)
          {
            MenuView()
          }
        }
      }
    }
  }
}

#Preview
{
  HomeView()
}
