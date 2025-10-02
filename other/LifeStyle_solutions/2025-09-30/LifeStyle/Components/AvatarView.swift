//
//  AvatarView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 26/09/2025.
//

import SwiftUI

struct AvatarView: View
{
  var title: String
  
  var body: some View
  {
    // Første bokstav i tittelen vises som en sirkel med gradient-bakgrunn.
    Text(title.first!.uppercased())
      .font(.title)
      .foregroundStyle(.white)
      .frame(width: 60, height: 60)
      .background(gradient)
      .clipShape(Circle())
  }
}

#Preview
{
  AvatarView(title: "Tittel")
}
