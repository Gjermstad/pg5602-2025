//
//  Exercise.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 13/09/2025.
//

import Foundation

// Exercise representerer en treningsøvelse og gjøres Identifiable
// slik at vi kan bruke den direkte i SwiftUI List/ForEach
struct Exercise: Identifiable
{
  // Unik identifikator – kreves av identifiable
  var id: UUID
  
  var title: String
  var notes: String
  var starred: Bool
  var archive: Bool
  var created: Date
  var updated: Date
  
  // Når vi lager et nytt Exercise-objekt, sørger init for at alle egenskapene
  // som tittel, notater, dato og ID – får riktige startverdier. Noen av disse
  // verdiene kan vi selv bestemme, mens andre blir automatisk satt, som for eksempel
  // en unik ID og tidspunktet for når objektet ble opprettet.
  init(title: String = "Tittel", notes: String = "Notater")
  {
    id = UUID()
    self.title = title
    self.notes = notes
    starred = false
    archive = false
    created = .now
    updated = .now
  }
}

let exercise1 = Exercise()
let exercise2 = Exercise(title: "Klatrevegg")
let exercise3 = Exercise(title: "Svømming", notes: "1000 meter brystsvømming.")
let exercise4 = Exercise(title: "Styrketrening", notes: "Armhevinger, planke og squats.")
let exercise5 = Exercise(title: "Løping", notes: "15 kilometer med intervaller.")

// I Swift anbefales å bruke xxxStore som navn for klasser som lagrer data
// ObservableObject betyr at objektet sier til Viewet at det har vært endring i klassen
class ExerciseStore: ObservableObject
{
  // @Published sier ifra at dette elementet publiserer endringer til Viewet
  // @Published brukes sammen med ObservableObject
  @Published var exercises: [Exercise] = []
  
  init() {
    exercises = [exercise1, exercise2, exercise3, exercise4, exercise5]
  }
}
