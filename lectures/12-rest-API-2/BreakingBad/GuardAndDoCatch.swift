//
//  GuardAndDoCatch.swift
//  BreakingBad
//
//  Created by Stig Orla Sørli Højklint on 08/10/2025.
//

/*
 
 🧭 1. guard

 Formål: Sjekker forventede betingelser tidlig i koden — og “bryter ut” dersom noe ikke stemmer.

 Brukes typisk til:

 - Å validere input
 - Å sikre at nødvendige verdier finnes før du fortsetter
 
 🔹 guard kaster ikke feil
 🔹 Det er en tidlig exit-mekanisme – du bruker det for å unngå at programmet går videre med ugyldige data.
 🔹 Brukes ofte sammen med if let-unwrapping og forvalidering.
 
 ⚡️ 2. do...catch

 Formål: Håndterer kastbare feil — altså feil fra funksjoner som er merket med throws.

 Brukes når:

 - Du kaller funksjoner som kan kaste (throws)
 - Du vil håndtere runtime exceptions (f.eks. feil i filtilgang, nettverksforespørsel osv.)

 🔹 do...catch brukes når feil faktisk kastes (throw)
 🔹 Du må bruke try foran funksjonskallet
 🔹 Du får mulighet til å fange og behandle feilen

 🧩 I SwiftUI-sammenheng

 Begge brukes, men til ulike formål:

 Du sjekker at en verdi finnes før du viser en View -> guard
 Du prøver å lese en fil, parse JSON, eller hente data fra et API -> do...catch
 Du vil validere en tekst før du lagrer den i SwiftData -> guard
 Du kaller en funksjon med throws (f.eks. try modelContext.save()) -> do...catch
 
 🔸 guard sørger for at du ikke prøver å lagre en ugyldig oppgave
 🔸 do...catch håndterer eventuelle feil i lagringen
 
*/
