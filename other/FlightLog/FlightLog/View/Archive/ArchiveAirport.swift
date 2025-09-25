//
//  ArchiveAirport.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 25/10/2023.
//

import SwiftData
import SwiftUI

struct ArchiveAirport: View
{
  @Environment(\.modelContext) private var context
  
  @Query(filter: #Predicate<Airport>{$0.trash == true},
         sort: \Airport.update, order: .reverse, animation: .default) private var airports: [Airport]
  
  var body: some View
  {
    if airports.isEmpty
    {
      Label("Ingen arkiverte flyplasser", systemImage: "house.and.flag")
    }
    else
    {
      ForEach(airports)
      {
        airport in
        
        VStack(alignment: .leading)
        {
          Text(airport.icao).fontWeight(.bold)
          Text(airport.name)
          Text("Arkivert: \(airport.update.formatted(date: .abbreviated, time: .standard))")
          
          if (airport.flights?.count ?? 0) > 0
          {
            Divider()
            Text("Flyplassen er registrert i \(airport.flights!.count) flyturer og kan derfor ikke slettes. ⚠️")
          }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
          Button(role: .destructive)
          {
            context.delete(airport)
          }
          label:
          {
            Image(systemName: "trash.fill")
          }
          .disabled((airport.flights?.count ?? 0) > 0)
          
          Button(role: .cancel)
          {
            airport.update = Date.now
            airport.trash = false
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
  ArchiveAirport()
}
