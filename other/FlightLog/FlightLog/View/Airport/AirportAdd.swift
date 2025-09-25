//
//  AirportAdd.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 26/10/2023.
//

import SwiftUI

struct AirportAdd: View
{
  @Environment(\.modelContext) private var context
  
  @AppStorage("isDarkMode") private var darkMode = false
  @Environment(\.dismiss) private var dismiss
  
  @State private var icao = ""
  @State private var iata = ""
  @State private var name = ""
  @State private var type = ""
  @State private var avatar = "airport1"
  @State private var frequency = ""
  @State private var navigation = ""
  @State private var city = ""
  @State private var country = ""
  @State private var latitude = 0.0
  @State private var longitude = 0.0
  @State private var elevation = ""
  @State private var note = ""
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        HStack
        {
          TextField("ICAO kode", text: $icao)
          Button
          {
            Task
            {
              let json = await getAirport(icao: icao)
              
              icao = icao.uppercased()
              iata = json.iata_code
              name = json.name
              city = json.municipality
              country = json.country.name
              latitude = json.latitude_deg
              longitude = json.longitude_deg
              elevation = json.elevation_ft
              note = json.home_link
            }
          }
          label:
          {
            Image(systemName: "scope")
          }
          .buttonStyle(.borderedProminent)
          
          TextField("IATA kode", text: $iata)
        }
        
        TextField("Navn på flyplass", text: $name)
        
        HStack
        {
          VStack(alignment: .leading)
          {
            if !elevation.isEmpty
            {
              Text("\(elevation) fot over havet")
            }
            
            if latitude != 0.0
            {
              Text(latitudeDMS(latitude: latitude))
            }
            
            if longitude != 0.0
            {
              Text(longitudeDMS(longitude: longitude))
            }
          }
          .foregroundStyle(.secondary)
          
          Picker("", selection: $avatar)
          {
            ForEach(1...5, id: \.self)
            {
              Image("airport\($0)").tag("airport\($0)")
            }
          }
        }
        
        Section
        {
          TextField("By", text: $city)
          TextField("Land", text: $country)
        }
        
        Section
        {
          Text(frequency)
          Text(navigation)
        }
        .foregroundStyle(.secondary)
        
        TextField("Notater", text: $note, axis: .vertical).lineLimit(2...4)
      }
      .toolbar
      {
        ToolbarItem(placement: .cancellationAction)
        {
          Button("Avbryt", role: .cancel)
          {
            dismiss()
          }
        }
        
        ToolbarItem(placement: .principal)
        {
          Text("Ny flyplass")
        }
        
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            let airport = Airport(icao: icao.uppercased(), iata: iata.uppercased())
            
            airport.name = name
            airport.type = type
            airport.avatar = avatar
            airport.frequency = frequency
            airport.navigation = navigation
            airport.city = city
            airport.country = country
            airport.latitude = latitude
            airport.longitude = longitude
            airport.elevation = elevation
            airport.country = country
            airport.note = note
            
            context.insert(airport)
            dismiss()
          }
          .disabled(icao.isEmpty)
        }
      }
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
  }
}

#Preview
{
  AirportAdd()
}
