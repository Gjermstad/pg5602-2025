//
//  LogoView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 09/09/2025.
//

import SwiftUI

struct LogoView: View
{
  // Når du markerer en variabel med @State, gjør du den reaktiv.
  // SwiftUI "overvåker" den, og hvis den endrer verdi, vil alle
  // views som avhenger av den automatisk tegnes på nytt.
  @State private var startAnimate = false
  
  var body: some View
  {
    Image("logo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .scaleEffect(startAnimate ? 1.0 : 0.5)
      .opacity(startAnimate ? 1.0 : 0.0)
      .onAppear
      {
        // Endrer variabelen til true med en animasjon.
        // easeOut gjør at bevegelsen starter raskt og roer ned mot slutten.
        withAnimation(.easeOut(duration: 3))
        {
          startAnimate = true
        }
      }
  }
}

#Preview
{
  LogoView()
}
