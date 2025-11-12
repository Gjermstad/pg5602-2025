//
//  waitBeforeUpdate.swift
//  Beacon
//
//  Created by Stig Højklint on 27/10/2025.
//

import SwiftUI

/// Venter en kort stund før en tekstverdi oppdateres.
///
/// Brukes for eksempel til søkefelt eller filtrering, der man ønsker
/// å unngå oppdatering for hvert tastetrykk.
///
/// Parameters:
/// - from: Binding til teksten som brukeren skriver (f.eks. et `TextField`)
/// - to: Binding til teksten som skal oppdateres etter forsinkelsen
/// - delay: Forsinkelse i millisekunder før oppdatering (standard 1000 ms = 1 sekund)

extension View
{
  func waitBeforeUpdate(from: Binding<String>, to: Binding<String>, delay: Int = 1000) -> some View
  {
    modifier(TextModifier(from: from, to: to, delay: delay))
  }
}

struct TextModifier: ViewModifier
{
  // Teksten som brukeren skriver (for eksempel i et søkefelt)
  @Binding var from: String
  
  // Teksten som oppdateres etter ventetiden
  @Binding var to: String
  
  // Hvor lenge vi skal vente før vi oppdaterer "to"
  var delay: Int
  
  // Holder på den aktive forsinkelsesoppgaven (Task)
  //
  // - Void betyr at oppgaven ikke returnerer noen verdi.
  // - Never betyr at oppgaven aldri kaster feil.
  //
  // Vi avbryter og starter en ny Task hver gang brukeren skriver,
  // slik at oppdateringen bare skjer når brukeren stopper.
  @State private var task: Task<Void, Never>?
  
  func body(content: Content) -> some View
  {
    content.onChange(of: from)
    {
      // Avbryt eventuell pågående Task hvis brukeren skriver videre
      task?.cancel()
      
      // Start en ny Task som venter før oppdatering
      task = Task
      {
        // Vent i [delay] millisekunder (konvertert til nanosekunder)
        try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000))
        
        // Når ventetiden er over og Tasken ikke er avbrutt -> Oppdater "to" med verdien fra "from"
        to = from
      }
    }
    .onDisappear
    {
      // Avbryt eventuell Task hvis viewet forsvinner
      task?.cancel()
    }
  }
}
