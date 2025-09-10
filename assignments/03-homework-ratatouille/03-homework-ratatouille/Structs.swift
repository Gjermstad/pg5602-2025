//
//  Structs.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 10/09/2025.
//

import Foundation

// Struct for oppskrifter
struct Recipe: Identifiable
{
  var id: UUID        // Unik ID for hver oppskrift
  var recipeName: String
  var ingress: String
  var notes: String
  var favorite: Bool   // Markør for favoritt
  var trash: Bool     // Markør for arkivert
  var created: Date   // Når oppskriften er lagt til
  
  init(recipeName: String, ingress: String? = nil, notes: String) {
    self.id = UUID()       // Lager unik id
    self.recipeName = recipeName
    self.ingress = ingress ?? ""
    self.notes = notes
    self.favorite = false
    self.trash = false
    self.created = .now     // Henter tid og dato når koden kjøres
  }
}

let testRecipe = Recipe(recipeName: "Pizza", ingress: "Beste italienske pizzaen", notes: "Put den i ovnen og ta av plastikken.")
