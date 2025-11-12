//
//  MessageView.swift
//  Flow
//
//  Created by Stig Orla Sørli Højklint on 10/10/2025.
//

import SwiftUI

struct MessageView: View
{
  var text: String
  
  var body: some View
  {
    HStack
    {
      Image(systemName: "exclamationmark.triangle.fill")
        .scaleEffect(2)
        .padding(.leading, 25)
        .foregroundStyle(.yellow)

      Text(text)
        .font(.title2).foregroundStyle(.secondary)
        .padding()
      
      Spacer()
    }
    .background(.ultraThinMaterial)
    .cornerRadius(15)
  }
}

#Preview
{
  MessageView(text: "Dette er en melding").padding()
}
