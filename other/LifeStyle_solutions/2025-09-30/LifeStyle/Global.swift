//
//  Config.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

// Foundation er et av de mest grunnleggende rammeverkene i iOS, macOS og Swift generelt.
import SwiftUI

let version = "27.09.2025-21:30"

// Navnet på SF Symbol som brukes når listen er tom
let emptyIcon = "square.stack.3d.up.slash"

// Maks synlig lengde på tittel og notater
let maxTitle = 20
let maxNotes = 60

// Lager en lineær gradient fra øvre venstre til nedre høyre hjørne
// med tilpasset gjennomsiktighet på fargene "leading" og "trailing"
let gradient = LinearGradient(
  colors: [Color("leading").opacity(0.2), Color("trailing").opacity(0.4)],
  startPoint: .topLeading,
  endPoint: .bottomTrailing
)
