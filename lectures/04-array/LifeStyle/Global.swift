//
//  Config.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

// Foundation er et av de mest grunnleggende rammeverkene i iOS, macOS og Swift generelt.
import Foundation

// Oppretter konstanter som ikke kan endres etter at de er satt.
let emojis: [String] = ["🥰🍎","🍊","🍋","🫐","🍒","🍍","🥝","🍇","🍊","🍌","🍎","🛜"]

let emptyicon = "square.stack.3d.up.slash"

// Oppretter variabler som kan endres. Du kan velge å være eksplisitt ved å beskrive type variabel
// eller overlate det til XCode. Eksplisitt betyr direkte, klart og tydelig formulert.
// Det motsatte av eksplisitt er implisitt.

var heltall1 = 500
var heltall2: Int = 500

var desimaltall1 = 123.000
var desimaltall2: Float = 123.000

var tekst1 = "abc"
var tekst2: String = "abc"

var dato1 = Date()
var dato2: Date = .now

// Oppretter en tekstvariabel med mye innhold. Bruker tre anførselstegn slik at teksten kan stå for seg selv.
let swift = """
SwiftUI er et rammeverk fra Apple som brukes til å lage brukergrensesnitt på tvers av alle Apple-plattformer, som iOS, iPadOS, macOS, watchOS og tvOS. Det introduserer en deklarativ måte å bygge grensesnitt på, noe som betyr at du beskriver hvordan brukergrensesnittet skal se ut og oppføre seg, i stedet for å spesifisere alle de detaljerte stegene for hvordan det skal bygges og oppdateres. Dette gjør koden mer oversiktlig, lettere å lese og enklere å vedlikeholde.

I SwiftUI definerer du brukergrensesnittet ved hjelp av komponenter som Text, Image, Button, VStack, HStack og mange andre. Disse komponentene kan settes sammen og kombineres for å lage komplekse grensesnitt. Når dataene i appen endres, oppdaterer SwiftUI automatisk grensesnittet for å reflektere de nye verdiene, takket være det som kalles state management. Dette gjør det enklere å håndtere dynamiske og interaktive apper.

SwiftUI integreres tett med Xcode, der du kan se en live forhåndsvisning av grensesnittet mens du skriver koden. Dette gir en umiddelbar visuell tilbakemelding som gjør utviklingsprosessen raskere og mer intuitiv. Rammeverket støtter også funksjoner som animasjoner, overganger og adaptivt design, slik at appene fungerer godt på forskjellige skjermstørrelser og plattformer. Samlet sett gjør SwiftUI det enklere og mer effektivt å bygge moderne, responsivt og vedlikeholdbart brukergrensesnitt for Apple-økosystemet.
"""
