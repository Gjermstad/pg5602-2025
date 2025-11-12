//
//  Bundle.swift
//  Beacon
//
//  Created by Stig Højklint on 27/10/2025.
//

import Foundation

/// Henter Geoapify API-nøkkel fra Secrets.plist på en trygg og ryddig måte.
///
/// - Hvorfor: Vi ønsker å unngå å hardkode API-nøkler direkte i kildekoden.
///   Ved å lagre dem i en .plist-fil som ikke sjekkes inn i Git, beskytter vi sensitive data.
///
/// - Hvordan: Vi bruker Bundle til å finne filen i appens ressursmappe.
///   Leser den som en NSDictionary, og henter ut verdien for nøkkelen (GeoapifyAPIKey).
///
/// - Viktig: Secrets.plist må være inkludert i riktig target for at Bundle skal finne den.
///   Hvis filen mangler eller er feil formatert, stopper appen med en tydelig feilmelding.

extension Bundle
{
  var getAPIKey: String
  {
    // Forsøk å finne filstien til Secret.plist i appens ressursmappe
    guard let path = self.path(forResource: "Secret", ofType: "plist") else
    {
      fatalError("""
      Secret.plist ble ikke funnet i appens bundle.
      Kontroller at filen finnes i prosjektet og at den er lagt til under riktig target.
      """)
    }
    
    // Les innholdet som en nøkkel-verdi-liste
    guard let dict = NSDictionary(contentsOfFile: path) else
    {
      fatalError("""
      Secret.plist kunne ikke leses som en gyldig Property List-fil.
      Kontroller at filformatet er korrekt, og at filen ikke er tom eller korrupt.
      """)
    }

    // Hent verdien for nøkkelen GeoApifyKey
    guard let key = dict["GeoApifyKey"] as? String else
    {
      fatalError("""
      Nøkkelen 'GeoApifyKey' ble ikke funnet eller har feil datatype i Secret.plist.
      Kontroller at filen inneholder en strengverdi med følgende struktur:
      
      <key>GeoApifyKey</key>
      <string>DIN_API_NØKKEL_HER</string>
      """)
    }

    return key
  }
}
