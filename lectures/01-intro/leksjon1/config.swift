//
//  config.swift
//  leksjon1
//
//  Created by Kenneth Andre Bettum Gjermstad on 27/08/2025.
//

import Foundation

// let er en konstant variabel som ikke kan endres
// Har du en veldig lang tekst - bruk 3 stk "" på egen linje før og etter teksten
let about: String = """
Swift er et programmeringsspråk utviklet av Apple for å lage apper til iOS, macOS, watchOS og tvOS. Det ble lansert i 2014 som en moderne arvtager til Objective-C, med mål om å være enklere å lære, tryggere å bruke og samtidig raskt nok til å håndtere tunge oppgaver. Swift er et såkalt "compiled language", noe som betyr at koden oversettes til maskinkode før den kjøres, og det gir god ytelse på Apple-enheter.

En av de viktigste grunnene til at Swift ble laget, var for å gjøre programmering mer tilgjengelig. Syntaksen (måten språket skrives på) er ryddig og lett å lese, og Apple har lagt stor vekt på å redusere feil som ofte skjer i andre språk. For eksempel passer Swift på at variabler må ha en verdi før de brukes, og at man ikke kan jobbe med "null" verdier uten å si eksplisitt at man tillater det. Dette kalles "optionals", og det gjør koden tryggere og mer forutsigbar.

Swift støtter både objektorientert og funksjonell programmering. Det betyr at man kan organisere koden i klasser og objekter, men man kan også bruke funksjoner og data på en mer "matematisk" måte. Denne fleksibiliteten gjør språket egnet til mange typer prosjekter, enten det er en liten mobilapp eller et større system. Samtidig har Swift mange innebygde funksjoner, som for eksempel "type inference" som gjør at kompilatoren kan gjette hvilken datatype en variabel har uten at man trenger å skrive det selv.

Et annet viktig trekk ved Swift er hvor tett det er integrert med utviklingsverktøyene til Apple. Man bruker som oftest Xcode, Apples egen utviklingsplattform, for å skrive, teste og publisere apper. Swift fungerer også godt sammen med SwiftUI, et nyere rammeverk som gjør det mulig å bygge brukergrensesnitt på en mer intuitiv måte ved å beskrive hvordan skjermen skal se ut, istedenfor å kode steg-for-steg hvordan elementene skal tegnes.

Språket er i stadig utvikling, med en stor åpen kildekode-fellesskap som bidrar til forbedringer. Det betyr at Swift ikke bare er bundet til Apple-økosystemet, men kan også brukes på Linux og Windows. Likevel er den største styrken fremdeles at det er språket som Apple selv satser på, og derfor er det det naturlige valget for alle som vil lage apper for iPhone, iPad og Mac.

Vil du at jeg skal sammenligne Swift med et språk du allerede kjenner, som JavaScript eller Kotlin, for å gjøre det lettere å se likheter og forskjeller?
"""

// var er en variabel som kan endres
var number = 1989

// Du deklarer datatype på en variabel med å legge til ": datatype"
var desimaler: Float = 123.456
