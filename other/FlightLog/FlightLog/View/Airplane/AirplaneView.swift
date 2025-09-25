//
//  AircraftView.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 17/10/2023.
//

import SwiftData
import SwiftUI

struct AirplaneView: View
{
  @AppStorage("isDarkMode") private var darkMode = false
  @Environment(\.dismiss) private var dismiss
  
  @Query(filter: #Predicate<Airplane>{$0.trash == false},
         sort: \Airplane.registration, order: .forward, animation: .default) private var airplanes: [Airplane]
  
  @State private var showSheet = false
  
  var body: some View
  {
    NavigationStack
    {
      Group
      {
        if airplanes.isEmpty
        {
          ContentUnavailableView("Ingen fly registert", systemImage: "square.stack.3d.up.slash")
        }
        else
        {
          List(airplanes)
          {
            airplane in
            
            NavigationLink
            {
              AirplaneEdit(airplane: airplane)
            }
            label:
            {
              AirplaneRow(airplane: airplane)
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
      .navigationTitle("Fly")
      .fullScreenCover(isPresented: $showSheet, content: AirplaneAdd.init)
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
  }
}

#Preview
{
  AirplaneView().modelContainer(for: Flight.self)
}
