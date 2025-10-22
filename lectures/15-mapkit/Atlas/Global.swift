//
//  Global.swift
//  Atlas
//
//  Created by Stig Orla Sørli Højklint on 22/10/2025.
//

import SwiftUI

struct myModifier: ViewModifier
{
  // Her lager vi signaturen til en View-modifier som kan gjenbrukes flere steder i appen
  func body(content: Content) -> some View
  {
    content
      .font(.title2)
      .padding()
      .background(.bar)
      .opacity(0.7)
      .clipShape(.circle)
      .shadow(radius: 5)
  }
}
