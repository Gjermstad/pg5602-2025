//
//  AirportView.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 08/10/2023.
//

import SwiftData
import SwiftUI

struct AirportView: View 
{
  @AppStorage("isDarkMode") private var darkMode = false
  @Environment(\.dismiss) private var dismiss
  
  @Query(filter: #Predicate<Airport>{$0.trash == false},
         sort: \Airport.icao, order: .forward, animation: .default) private var airports: [Airport]
  
  @State private var showSheet = false
  
  var body: some View
  {
    NavigationStack
    {
      Group
      {
        if airports.isEmpty
        {
          ContentUnavailableView("Ingen flyplasser registert", systemImage: "square.stack.3d.up.slash")
        }
        else
        {
          List(airports)
          {
            airport in
            
            NavigationLink
            {
              AirportEdit(airport: airport)
            }
            label:
            {
              AirportRow(airport: airport)
            }
          }
        }
      }
      .toolbar
      {
        ToolbarItem(placement: .topBarLeading)
        {
          Button()
          {
            dismiss()
          }
          label:
          {
            Image(systemName: "chevron.backward")
            Text("Tilbake")
          }
        }
        
        ToolbarItem(placement: .topBarTrailing)
        {
          Button
          {
            showSheet.toggle()
          }
          label:
          {
            Image(systemName: "plus.circle.fill").font(.title)
          }
        }
      }
      .navigationTitle("Flyplasser")
      .fullScreenCover(isPresented: $showSheet, content: AirportAdd.init)
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
  }
}

#Preview
{
  AirportView().modelContainer(for: Flight.self)
}
