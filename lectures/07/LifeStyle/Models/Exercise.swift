//
//  Exercise.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 13/09/2025.
//

import Foundation

enum Level: Int8, Identifiable, CaseIterable
{
  case easy
  case medium
  case hard
  
  // Vi sier at råverdien (0, 1 og 2) returneres som id
  var id: Int8 { rawValue }
  
  // For CaseInterable så lages en switch med returverdi
  var title: String
  {
    switch self
    {
      case .easy: "Enkel"
      case .medium: "Middels"
      case .hard: "Hard"
    }
  }
}

// Exercise representerer en treningsøvelse.
// Den gjøres Identifiable slik at SwiftUI kan bruke den i
// List og ForEach uten at vi må angi en egen id manuelt.
struct Exercise: Identifiable
{
  // Unik identifikator – kreves av identifiable
  var id: UUID
  
  var title: String
  var notes: String
  var level: Level
  var starred: Bool
  var archive: Bool
  var created: Date
  var updated: Date
  
  // Når vi lager et nytt Exercise-objekt, sørger init for at alle egenskapene
  // som tittel, notater, dato og ID – får riktige startverdier. Noen av disse
  // verdiene kan vi selv bestemme, mens andre blir automatisk satt, som for eksempel
  // en unik ID og tidspunktet for når objektet ble opprettet.
  init(title: String = "Tittel", notes: String = "Notater", level: Level = .easy)
  {
    id = UUID()
    self.title = title
    self.notes = notes
    self.level = level
    starred = false
    archive = false
    created = .now
    updated = .now
  }
}


// Jeg har valgt ExerciseStore, siden det er idiomatisk i SwiftUI
// og formidler at klassen er en beholdning/lagringsplass for øvelser.
// ExerciseStore fungerer som en "datasentral" for treningsøvelser.
// Klassen er ObservableObject, slik at SwiftUI automatisk oppdaterer views
// når listen med øvelser endres. Den starter med noen eksempler, men kan
// senere utvides til å hente, lagre og oppdatere data fra en database.
class ExerciseStore: ObservableObject
{
  // @Published gjør at alle views som bruker ExerciseStore vil oppdateres
  // når denne listen endres (for eksempel hvis vi legger til eller sletter øvelser).
  @Published var exercises: [Exercise] = []
  
  init()
  {
    exercises = [exercise1, exercise2, exercise3, exercise4, exercise5]
  }
}

// Eksempeldata – brukes til å fylle appen med innhold i starten.
// Dette er nyttig både for testing og for forhåndsvisning i SwiftUI.
let exercise1 = Exercise()
let exercise2 = Exercise(title: "Klatrevegg")
let exercise3 = Exercise(title: "Svømming", notes: "1000 meter brystsvømming.")
let exercise4 = Exercise(title: "Styrketrening", notes: "Armhevinger, planke og squats.")
let exercise5 = Exercise(title: "Løping", notes: "15 kilometer med intervaller.")
