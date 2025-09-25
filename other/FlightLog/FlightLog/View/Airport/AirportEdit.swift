//
//  AirportEdit.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 23/10/2023.
//

import SwiftUI

struct AirportEdit: View
{
  @Bindable var airport: Airport
  
  @AppStorage("isDarkMode") private var darkMode = false
  @Environment(\.dismiss) private var dismiss
  
  @State private var icao = ""
  @State private var iata = ""
  @State private var name = ""
  @State private var type = ""
  @State private var avatar = ""
  @State private var frequency = ""
  @State private var navigation = ""
  @State private var city = ""
  @State private var country = ""
  @State private var note = ""
  
  var body: some View
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
            let airport = await getAirport(icao: icao)
            
            icao = icao.uppercased()
            iata = airport.iata_code
            name = airport.name
            city = airport.municipality
            country = airport.country.name
            note = airport.home_link
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
          if !airport.elevation.isEmpty
          {
            Text("\(airport.elevation) fot over havet")
          }
          
          if airport.latitude != 0.0
          {
            Text(latitudeDMS(latitude: airport.latitude))
          }
          
          if airport.longitude != 0.0
          {
            Text(longitudeDMS(longitude: airport.longitude))
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
        Text(frequency)
        Text(navigation)
      }
      .foregroundStyle(.secondary)
      
      TextField("Notater", text: $note, axis: .vertical).lineLimit(2...4)
      
      Section
      {
        Text("Opprettet: \(airport.create.formatted(date: .abbreviated, time: .standard))")
        Text("Sist endret: \(airport.update.formatted(date: .abbreviated, time: .standard))")
      }
      .foregroundStyle(.secondary)
    }
    .onAppear
    {
      icao = airport.icao
      iata = airport.iata
      name = airport.name
      type = airport.type
      avatar = airport.avatar
      frequency = airport.frequency
      navigation = airport.navigation
      city = airport.city
      country = airport.country
      note = airport.note
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
        Text("Redigere flyplass")
      }
      
      ToolbarItem(placement: .confirmationAction)
      {
        Button("Lagre")
        {
          airport.icao = icao.uppercased()
          airport.iata = iata.uppercased()
          airport.name = name
          airport.type = type
          airport.avatar = avatar
          airport.frequency = frequency
          airport.navigation = navigation
          airport.city = city
          airport.country = country
          airport.note = note
          airport.update = Date.now
          
          dismiss()
        }
        .disabled(icao.isEmpty)
      }
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
    .navigationBarBackButtonHidden()
  }
}
