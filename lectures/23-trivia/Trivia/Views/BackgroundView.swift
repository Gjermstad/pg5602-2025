//
//  BackgroundView.swift
//  Trivia
//
//  Created by Stig Orla Sørli Højklint on 10/11/2025.
//

import SwiftUI

struct BackgroundView: View
{
  var body: some View
  {
    ZStack
    {
      // Dyp bakgrunn
      RadialGradient(
        colors: [Color.indigo.opacity(0.6), Color.black],
        center: .center,
        startRadius: 100,
        endRadius: 600)

      // Lett fargetone over
      LinearGradient(
        colors: [Color.purple.opacity(0.2), Color.blue.opacity(0.2)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    }
    .ignoresSafeArea()
  }
}


#Preview
{
  BackgroundView()
}
