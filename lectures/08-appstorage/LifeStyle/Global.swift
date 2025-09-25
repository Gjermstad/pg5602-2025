//
//  Config.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

// Foundation er et av de mest grunnleggende rammeverkene i iOS, macOS og Swift generelt.
import SwiftUI

let version = "15.09.2025-1"

// Navnet på SF Symbol som brukes når listen er tom
let emptyicon = "square.stack.3d.up.slash"

// Lager en lineær gradient fra øvre venstre til nedre høyre hjørne
// med tilpasset gjennomsiktighet på fargene "leading" og "trailing"
let gradient = LinearGradient(
    colors: [Color("leading").opacity(0.3), Color("trailing").opacity(0.5)],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)

let settings =
"""
Innstillinger samler alt brukeren kan tilpasse eller kontrollere i appen.

Brukerpreferanser inkluderer tema (lys/mørk), språkvalg og varslinger.
Konto og sikkerhet dekker innlogging, passord og personvern.
App-spesifikke valg kan være startskjerm, sortering, filtre og favoritter.
Hjelp og informasjon gir app-versjon, brukerstøtte og FAQ.
Avansert/systemvalg kan være eksport/import av data, tilbakestill app eller beta-funksjoner.

Kort sagt: innstillinger gir brukeren kontroll og oversikt over appen.
"""
