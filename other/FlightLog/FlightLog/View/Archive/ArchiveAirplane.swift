//
//  ArchiveAircraft.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 25/10/2023.
//

import SwiftData
import SwiftUI

struct ArchiveAirplane: View
{
  @Environment(\.modelContext) private var context
  
  @Query(filter: #Predicate<Airplane>{$0.trash == true},
         sort: \Airplane.update, order: .reverse, animation: .default) private var airplanes: [Airplane]
  
  var body: some View
  {
    if airplanes.isEmpty
    {
      Label("Ingen arkiverte fly", systemImage: "airplane")
    }
    else
    {
      List(airplanes)
      {
        airplane in
        
        HStack(alignment: .center)
        {
          VStack(alignment: .leading)
          {
            Text(airplane.registration).fontWeight(.bold)
            Text(airplane.name)
            Text("Arkivert: \(airplane.update.formatted(date: .abbreviated, time: .standard))")
            
            if (airplane.flights?.count ?? 0) > 0
            {
              Divider()
              Text("Flyet er registrert i \(airplane.flights!.count) flyturer og kan derfor ikke slettes. ⚠️")
            }
          }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
          Button(role: .destructive)
          {
            context.delete(airplane)
          }
          label:
          {
            Image(systemName: "trash.fill")
          }
          .disabled((airplane.flights?.count ?? 0) > 0)
          
          Button(role: .cancel)
          {
            airplane.update = Date.now
            airplane.trash = false
          }
          label:
          {
            Image(systemName: "tray.and.arrow.up.fill")
          }
        }
      }
    }
  }
}

#Preview 
{
  ArchiveAirplane().modelContainer(for: Flight.self)
}
