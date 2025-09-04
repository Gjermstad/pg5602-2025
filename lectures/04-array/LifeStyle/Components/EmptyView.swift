//
//  EmptyView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftUI

struct EmptyView: View
{
  // Om du har variabler som ikke starter med verdier så blir de påbudte parameter 
  var title: String
  var notes: String
  
  // Konstruktør
  init(title: String = "Ingen data registrert", notes: String = "Vennligst legg til data")
  {
    self.title = title
    self.notes = notes
  }
  
  var body: some View
  {
    ContentUnavailableView(title, systemImage: emptyicon, description: Text(notes))
  }
}

#Preview
{
  EmptyView()
}
