//
//  Exercise.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 13/09/2025.
//

import Foundation
import SwiftData

// @Model: Dette markerer klassen som en SwiftData-modell. Objektet kan dermed persisteres, dvs.
// lagres permanent i en lokal database, slik at dataene ikke går tapt når appen lukkes.
@Model final class ExerciseModel
{
  @Attribute(.unique) var id: UUID
  var title: String
  var notes: String
  var level: Int
  
  // Én Exercise kan bare ha EN Category.
  var category: CategoryModel?
  
  var favorite: Bool
  var trashbin: Bool
  var create: Date
  var update: Date
  
  // Når vi lager et nytt Exercise-objekt, sørger init for at alle egenskapene
  // som tittel, notater osv får riktige startverdier.
  init(title: String = "Tittel", notes: String = "Notater")
  {
    id = UUID()
    self.title = title
    self.notes = notes
    level = 0
    favorite = false
    trashbin = false
    create = .now
    update = .now
  }
}

// Eksempeldata – brukes til å fylle appen med innhold i starten.
// Dette er nyttig både for testing og for forhåndsvisning i SwiftUI.
let exercise = ExerciseModel(title: "Test trening", notes: "Notater som beskriver test treningen.")
