//
//  AircraftEdit.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 17/10/2023.
//

import SwiftUI

struct AirplaneEdit: View
{
  @Bindable var airplane: Airplane
  
  @AppStorage("isDarkMode") private var darkMode = false
  @Environment(\.dismiss) private var dismiss
  
  @State private var registration = ""
  @State private var name = ""
  @State private var type = ""
  @State private var avatar = ""
  @State private var seats = 0
  @State private var ifr = false
  @State private var twin = false
  @State private var turbine = false
  @State private var iceprotection = false
  @State private var multipilot = false
  @State private var simulator = false
  @State private var service = ""
  @State private var arc = Date.distantFuture
  @State private var extinguisher = Date.distantFuture
  @State private var firstaid = Date.distantFuture
  @State private var note = ""
  
  var body: some View
  {
    Form
    {
      HStack
      {
        TextField("Registrering", text: $registration)
        TextField("Type", text: $type)
      }
      
      TextField("Navn", text: $name)
      
      HStack
      {
        Stepper("\(seats) seter", value: $seats, in: 1...20).frame(minWidth: 180)
        
        Picker("", selection: $avatar)
        {
          ForEach(1...17, id: \.self)
          {
            Image("airplane\($0)").tag("airplane\($0)")
          }
        }
      }
      
      Section
      {
        Picker("", selection: $ifr)
        {
          Text("VFR").tag(false)
          Text("IFR").tag(true)
        }
        
        Picker("", selection: $twin)
        {
          Text("1 MOTOR").tag(false)
          Text("2 MOTORER").tag(true)
        }
        
        Picker("", selection: $turbine)
        {
          Text("STEMPEL").tag(false)
          Text("TURBIN").tag(true)
        }
      }
      .pickerStyle(.segmented)
      
      Section
      {
        Toggle(isOn: $iceprotection)
        {
          Text("Beskyttelse mot ising")
        }
        
        Toggle(isOn: $multipilot)
        {
          Text("Multi pilot fly")
        }
        
        Toggle(isOn: $simulator)
        {
          Text("Fly simulator")
        }
      }
      
      Section
      {
        HStack
        {
          Text("Neste service ved ")
          Spacer()
          TextField("Totaltid", text: $service).textFieldStyle(RoundedBorderTextFieldStyle())
        }
        
        DatePicker(selection: $arc, displayedComponents: .date)
        {
          Text("Luftdyktighetsbevis")
        }
        
        DatePicker(selection: $extinguisher, displayedComponents: .date)
        {
          Text("Brannslukkerapparat")
        }
        
        DatePicker(selection: $firstaid, displayedComponents: .date)
        {
          Text("Førstehjelpsutstyr")
        }
      }
      
      TextField("Notater", text: $note, axis: .vertical).lineLimit(2...4)
      
      Section
      {
        Text("Opprettet: \(airplane.create.formatted(date: .abbreviated, time: .standard))")
        Text("Sist endret: \(airplane.update.formatted(date: .abbreviated, time: .standard))")
      }
      .foregroundStyle(.secondary)
    }
    .onAppear
    {
      registration = airplane.registration
      name = airplane.name
      type = airplane.type
      avatar = airplane.avatar
      seats = airplane.seats
      ifr = airplane.ifr
      twin = airplane.twin
      turbine = airplane.turbine
      iceprotection = airplane.iceprotection
      multipilot = airplane.multipilot
      simulator = airplane.simulator
      service = airplane.service
      arc = airplane.arc
      extinguisher = airplane.extinguisher
      firstaid = airplane.firstaid
      note = airplane.note
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
        Text("Redigere fly")
      }
      
      ToolbarItem(placement: .confirmationAction)
      {
        Button("Lagre")
        {
          airplane.registration = registration.uppercased()
          airplane.type = type.uppercased()
          airplane.name = name
          airplane.avatar = avatar
          airplane.seats = seats
          airplane.ifr = ifr
          airplane.twin = twin
          airplane.turbine = turbine
          airplane.iceprotection = iceprotection
          airplane.multipilot = multipilot
          airplane.simulator = simulator
          airplane.service = service
          airplane.arc = arc
          airplane.extinguisher = extinguisher
          airplane.firstaid = firstaid
          airplane.note = note
          airplane.update = Date.now
          
          dismiss()
        }
        .disabled(registration.isEmpty)
      }
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
    .navigationBarBackButtonHidden()
  }
}
