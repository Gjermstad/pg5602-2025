//
//  AirportRow.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 23/10/2023.
//

import SwiftUI

struct AirportRow: View
{
  var airport: Airport
  
  var body: some View
  {
    HStack(alignment: .center)
    {
      Image(airport.avatar).resizable().frame(width: 60, height: 60)
      
      VStack(alignment: .leading)
      {
        Text(airport.icao).fontWeight(.bold)
        Text(airport.name)
      }
        
      if airport.favorite
      {
        Spacer()
        Image(systemName: "star.fill").foregroundColor(.yellow).font(.title2)
      }
    }
    .swipeActions(edge: .leading, allowsFullSwipe: true)
    {
      Button
      {
        airport.favorite.toggle()
      }
      label:
      {
        Image(systemName: "star.fill")
      }
      .tint(.yellow)
    }
    .swipeActions(edge: .trailing, allowsFullSwipe: false)
    {
      Button(role: .destructive)
      {
        airport.trash = true
      }
      label:
      {
        Image(systemName: "archivebox")
      }
    }
  }
}
