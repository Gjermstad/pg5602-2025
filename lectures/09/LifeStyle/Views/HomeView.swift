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
  // Dette gjør at variabelen 'store' automatisk holder en oppdatert liste over alle Exercise-objekter
  // Listen oppdateres automatisk i UI når objekter blir lagt til, endret eller slettet
  // private gjør at listen kun kan brukes innenfor dette Viewet
  @Query(sort: \Exercise.created) private var store: [Exercise]
  
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
          if store.isEmpty
          {
            EmptyView()
          }
          else
          {
            List(store)
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
                Text(exercise.category?.title ?? "Ingen kategori").font(.caption)
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
  HomeView().modelContainer(for: [Exercise.self])
}
