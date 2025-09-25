//
//  AircraftRow.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 17/10/2023.
//

import SwiftUI

struct AirplaneRow: View
{
  var airplane: Airplane
  
  var body: some View
  {
    HStack(alignment: .center)
    {
      Image(airplane.avatar).resizable().frame(width: 60, height: 60)
        
      VStack(alignment: .leading)
      {
        Text(airplane.registration).fontWeight(.bold)
        Text(airplane.name)
      }
      
      if airplane.favorite
      {
        Spacer()
        Image(systemName: "star.fill").foregroundColor(.yellow).font(.title2)
      }
    }
    .swipeActions(edge: .leading, allowsFullSwipe: true)
    {
      Button
      {
        airplane.favorite.toggle()
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
        airplane.trash = true
      }
      label:
      {
        Image(systemName: "tray.and.arrow.down.fill")
      }
    }
  }
}
