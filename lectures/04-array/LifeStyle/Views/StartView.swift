//
//  StartView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftUI

struct StartView: View
{
  var body: some View
  {
    NavigationStack
    {
      List
      {
        ForEach(emojis, id: \.self)
        {
          emoji in Text(emoji)
        }
      }
    }
  }
}

#Preview
{
  StartView()
}
