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

// @Model: Dette markerer klassen som en SwiftData-modell. Objektet kan dermed persisteres, dvs.
// lagres permanent i en lokal database, slik at dataene ikke går tapt når appen lukkes.
// Exercise-modellen representerer en treningsøvelse som lagres i databasen ved hjelp av SwiftData.
// Når vi skriver @Model foran klassen, forteller vi SwiftData at dette er en type som skal kunne
// lagres, hentes og oppdateres i en database, uten at vi trenger å skrive SQL selv.

@Model final class ExerciseModel
{
  // id er en unik identifikator for hver Exercise.
  // @Attribute(.unique) betyr at verdien må være unik – ingen to Exercise-objekter
  // i databasen kan ha samme id. Dette brukes for å skille objektene fra hverandre.
  @Attribute(.unique) var id: UUID
  
  var title: String
  var notes: String
  var level: Int
  
  // Relasjon tilbake til Category.
  // Dette fullfører koblingen til Category.Exercises.
  // Én Exercise kan bare ha ÉN Category.
  var category: CategoryModel?
  
  var favorite: Bool
  var trashBin: Bool
  var create: Date
  var update: Date
  
  // Når vi lager et nytt Exercise-objekt, sørger init for at alle egenskapene
  // som tittel, notater, dato og ID – får riktige startverdier. Noen av disse
  // verdiene kan vi selv bestemme, mens andre blir automatisk satt, som for eksempel
  // en unik ID og tidspunktet for når objektet ble opprettet.
  // Siden category kan være tom trenger ikke den å være med i init
  init(title: String = "Tittel", notes: String = "Notater")
  {
    id = UUID()
    self.title = title
    self.notes = notes
    level = 0
    favorite = false
    trashBin = false
    create = .now
    update = .now
  }
}

// Eksempeldata – brukes til å fylle appen med innhold i starten.
// Dette er nyttig både for testing og for forhåndsvisning i SwiftUI.
let exercise = ExerciseModel(title: "Løping", notes: "15 kilometer med intervaller.")
