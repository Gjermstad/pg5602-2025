//
//  Bundle.swift
//  Beacon
//

import Foundation

// Henter Geoapify API-nøkkel fra Secrets.plist på en trygg og ryddig måte.
// Vi ønsker å unngå å hardkode API-nøkler direkte i kildekoden.
// Ved å lagre dem i en .plist-fil som ikke sjekkes inn i Git, beskytter vi sensitive data.
// Secrets.plist må være inkludert i riktig target for at Bundle skal finne den.
// Hvis filen mangler eller er feil formatert, stopper appen med en tydelig feilmelding.

extension Bundle
{
  var apiKey: String
  {
    // Forsøker å finne Secret.plist i appens ressursmappe
    guard let path = self.path(forResource: "Secret", ofType: "plist") else
    {
      fatalError("""
      Secret.plist ble ikke funnet i appens bundle.
      Kontroller at filen finnes i prosjektet og at den er lagt til under riktig mappe.
      """)
    }
    
    // Leser innholdet som en liste av nøkkel verdier
    guard let dict = NSDictionary(contentsOfFile: path) else
    {
      fatalError("""
      Secret.plist kunne ikke leses som en gyldig nøkkel fil.
      Kontroller at filformatet er korrekt, og at filen ikke er tom eller korrupt.
      """)
    }

    // Henter verdien for nøkkelen GeoApifyKey
    guard let key = dict["GeoApifyKey"] as? String else
    {
      fatalError("⚠️ Nøkkelen GeoApifyKey ble ikke funnet eller har feil datatype i Secret.plist.")
    }

    return key
  }
}
