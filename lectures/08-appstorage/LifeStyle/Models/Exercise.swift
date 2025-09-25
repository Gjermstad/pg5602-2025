//
//  Exercise.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 13/09/2025.
//

import Foundation
import SwiftData // biblioteket for datamodelering/lagre data på mobilen

// @Model gjør at klassen kan lagres på enheten
@Model class Exercise
{
  // Unik identifikator
  @Attribute(.unique) var id: UUID
  
  var title: String
  var notes: String
  var category: Category? // ? betyr at kategori kan være tom, og da trenger vi ikke å legge den i init()
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

// Eksempeldata – brukes til å fylle appen med innhold i starten.
// Dette er nyttig både for testing og for forhåndsvisning i SwiftUI.
let exercise1 = Exercise(title: "Løping", notes: "15 kilometer med intervaller. Løper som bare faaen til hjertet føles som om det skal falle ut av kroppen")
