//
//  ArchiveFlight.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 25/10/2023.
//

import SwiftData
import SwiftUI

struct ArchiveFlight: View
{
  @Environment(\.modelContext) private var context
  
  @Query(filter: #Predicate<Flight>{$0.trash == true},
         sort: \Flight.update, order: .reverse, animation: .default) private var flights: [Flight]
  
  var body: some View
  {
    if flights.isEmpty
    {
      Label("Ingen arkiverte flyginger", systemImage: "airplane.departure")
    }
    else
    {
      ForEach(flights)
      {
        flight in
        
        VStack(alignment: .leading)
        {
          Text(flight.from?.name ?? "Ingen data").fontWeight(.bold)
          Text("Arkivert: \(flight.update.formatted(date: .abbreviated, time: .standard))")
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
          Button(role: .destructive)
          {
            context.delete(flight)
          }
          label:
          {
            Image(systemName: "trash.fill")
          }
          
          Button(role: .cancel)
          {
            flight.update = Date.now
            flight.trash = false
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
    ArchiveFlight()
}
