//
//  Exercise.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 13/09/2025.
//

// Dette importerer Foundation-rammeverket som er en samling grunnleggende verktøy og funksjonalitet i Swift.
// Den gir tilgang til viktige typer og funksjoner som String, Int, Date, UUID, Array, Dictionary osv.
// Fil- og datastrukturhåndtering. Tid og dato-operasjoner. Nettverksfunksjoner, JSON-koding/avkoding osv.
// Kort sagt, nesten all Swift-kode som håndterer data, datoer eller grunnleggende funksjonalitet trenger Foundation.
import Foundation

// Dette importerer SwiftData, som er Apples nye rammeverk for datalagring (datamodellering) i SwiftUI/Swift.
// SwiftData lar deg definere modeller (ofte med @Model) og lagre objekter i en lokal database med enkel
// CRUD-funksjonalitet (Create, Read, Update, Delete).
// Lagre brukergenererte data (f.eks. notater, favoritter, kategorier).
// Definere relasjoner mellom objekter. Automatisere synkronisering mellom brukergrensesnittet og databasen.
import SwiftData

// Enum representerer vanskelighetsgrad til ExerciseStore
// Hver case får automatisk verdi, easy = 0, medium = 1, hard = 2
// CaseIterable lar deg hente Level.allCases (brukes i ForEach/Picker).
// Identifiable + id gjør enumen brukbar i SwiftUI-lister.
// title gir deg en bruker-vennlig tekst i stedet for å vise rawValue.
enum Level: Int, CaseIterable, Identifiable
{
  case easy = 0
  case medium = 1
  case hard = 2
  
  // Identifiable krever en unik id
  // Her brukes enumens råverdi (Int) som ID
  var id: Int { rawValue }
  
  // Gir en pen tekst til UI
  // Returnerer en streng basert på hvilket case som er valgt
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

// @Model: Dette markerer klassen som en SwiftData-modell. Objektet kan dermed persisteres, dvs.
// lagres permanent i en lokal database, slik at dataene ikke går tapt når appen lukkes.
// Exercise-modellen representerer en treningsøvelse som lagres i databasen ved hjelp av SwiftData.
// Når vi skriver @Model foran klassen, forteller vi SwiftData at dette er en type som skal kunne
// lagres, hentes og oppdateres i en database, uten at vi trenger å skrive SQL selv.

@Model final class Exercise
{
  // id er en unik identifikator for hver Exercise.
  // @Attribute(.unique) betyr at verdien må være unik – ingen to Exercise-objekter
  // i databasen kan ha samme id. Dette brukes for å skille objektene fra hverandre.
  @Attribute(.unique) var id: UUID
  
  var title: String
  var notes: String
  var levelValue: Int
  
  // Relasjon tilbake til Category.
  // Dette fullfører koblingen til Category.Exercises.
  // Én Exercise kan bare ha ÉN Category.
  var category: Category?
  
  var starred: Bool
  var archive: Bool
  var created: Date
  var updated: Date
  
  // Computed property gir deg en type-sikker enum basert på lagret Int-verdi.
  // Denne brukes i UI og logikk, mens selve verdien lagres som levelValue i databasen.
  var level: Level
  {
    // Når du henter verdien fra exercise.level, kjøres denne get-blokken.
    // Den forsøker å lage en Level-enum fra levelValue, som er en Int.
    // Hvis 'levelValue' ikke matcher noen case, returneres .easy som standard.
    get
    {
      Level(rawValue: levelValue) ?? .easy
    }
    
    // Når du setter exercise.level = .hard, kjøres denne set-blokken.
    // Den oversetter enumen til en Int og lagrer den i levelValue.
    set(newValue)
    {
      levelValue = newValue.rawValue
    }
  }
  
  // Når vi lager et nytt Exercise-objekt, sørger init for at alle egenskapene
  // som tittel, notater, dato og ID – får riktige startverdier. Noen av disse
  // verdiene kan vi selv bestemme, mens andre blir automatisk satt, som for eksempel
  // en unik ID og tidspunktet for når objektet ble opprettet.
  init(title: String = "Tittel", notes: String = "Notater")
  {
    id = UUID()
    self.title = title
    self.notes = notes
    levelValue = Level.easy.rawValue
    starred = false
    archive = false
    created = .now
    updated = .now
  }
}

// Eksempeldata – brukes til å fylle appen med innhold i starten.
// Dette er nyttig både for testing og for forhåndsvisning i SwiftUI.
let exercise = Exercise(title: "Løping", notes: "15 kilometer med intervaller.")
