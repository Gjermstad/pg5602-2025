//
//  Documentation.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 27/09/2025.
//

/*

Hvordan SwiftData/SQLite håndterer lagring på filnivå. Når du ser disse tre filene:

LifeStyle.store
LifeStyle.store-shm
LifeStyle.store-wal

så er det fordi SwiftData (som under panseret bruker SQLite) kjører i WAL-modus (Write-Ahead Logging).
La oss forklare hver fil:

1. LifeStyle.store
Dette er hoveddatabasefilen. Den inneholder selve strukturen for databasen (tabeller, kolonner) og
data som er skrevet til disk og “committed” til hovedfilen.

2. LifeStyle.store-shm
SHM står for Shared Memory.
Den brukes til å koordinere tilgang til databasen når flere tråder eller prosesser leser/skriver samtidig.
Den inneholder midlertidig metadata som hjelper SQLite med å holde styr på hvilke deler av databasen som er i bruk.

3. LifeStyle.store-wal
WAL står for Write-Ahead Log.
Når du gjør endringer i databasen, blir de først skrevet til denne filen, ikke direkte til hovedfilen (LifeStyle.store).
Dette gir bedre ytelse og sikkerhet (det er lettere å rulle tilbake endringer om noe går galt).
Periodisk blir innholdet i WAL-filen “committed” tilbake til hovedfilen.

💡 Kort sagt:

LifeStyle.store = hoveddatabase
LifeStyle.store-wal = midlertidige endringer som ikke er “committed”
LifeStyle.store-shm = koordinering og metadata for samtidige operasjoner

Dette er helt normalt for databaser som bruker WAL-modus, og alle tre filene trengs for at databasen skal fungere korrekt.

💡 WAL-modus:

WAL står for Write-Ahead Logging, og det er en spesiell måte SQLite (og dermed SwiftData) håndterer database-skriving på.
Her er en grundig, men forståelig forklaring:

Hvordan det fungerer

Normalt, uten WAL, ville SQLite skrive direkte til hoveddatabasefilen. Dette kan skape problemer:
Hvis en prosess skriver samtidig som en annen leser, kan leseren få ufullstendige data.
Skrivinger krever ofte å låse hele databasen, noe som kan være tregt.

WAL-modus løser dette:

Alle endringer går først til WAL-filen (LifeStyle.store-wal).
Ny data eller oppdateringer skrives her først.
Dette skjer før hoveddatabasefilen (LifeStyle.store) oppdateres.
Lesing kan fortsatt skje fra hovedfilen samtidig.
Det gjør at lesere og skrivere kan jobbe samtidig uten å blokkere hverandre.
Periodisk blir WAL-filen “commit-et” til hovedfilen.
Endringene fra WAL-filen flettes tilbake til hovedfilen.
Da blir de permanente.
Etterpå tømmes WAL-filen.

SHM-filen (LifeStyle.store-shm) holder styr på metadata
Hvilke deler av databasen som er oppdatert, hvilke transaksjoner som pågår, etc.

Fordeler med WAL

Bedre ytelse ved mange samtidige lesinger og skrivinger.
Økt sikkerhet – du kan rulle tilbake transaksjoner om noe går galt før de er commit-et.
Mindre risiko for korrupt database ved plutselig krasj.

💡 Kort eksempel:
Tenk på WAL som et “post-it notat” der du først skriver alle endringer.
Når alt er klart og korrekt, limer du det over i hovedboken (hovedfilen).
SHM-filen er som et lite register som viser hvilke post-its som er i bruk akkurat nå.

*/
