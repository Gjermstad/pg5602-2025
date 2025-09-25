//
//  AircraftAdd.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 17/10/2023.
//

import SwiftUI

struct AirplaneAdd: View
{
  @AppStorage("isDarkMode") private var darkMode = false
  @Environment(\.dismiss) private var dismiss
  
  @Environment(\.modelContext) private var context
  
  @State private var registration = ""
  @State private var name = ""
  @State private var type = ""
  @State private var avatar = "airplane1"
  @State private var seats = 4
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
    NavigationStack
    {
      Form
      {
        HStack
        {
          TextField("Registrering", text: $registration)
          TextField("Type", text: $type)
        }
        
        TextField("Navn på fly", text: $name)
        
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
          Text("Nytt fly")
        }
        
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            let airplane = Airplane(registration: registration.uppercased())
            
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
            
            context.insert(airplane)
            dismiss()
          }
          .disabled(registration.isEmpty)
        }
      }
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
  }
}

#Preview 
{
  AirplaneAdd()
}
