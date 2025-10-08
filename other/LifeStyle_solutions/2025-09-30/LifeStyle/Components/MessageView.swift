//
//  MessageView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 30/09/2025.
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
        .font(.title)
        .foregroundColor(.trailing)
        .padding(.leading)
      
      Text(text)
        .foregroundColor(.secondary)
        .padding()
      
      Spacer()
    }
    .background(gradient)
    .cornerRadius(10)
  }
}

#Preview
{
  MessageView(text: "Dette er en melding som gjerne kan gå over flere linjer")
    .padding()
}
