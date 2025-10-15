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
        .font(.title)
        .foregroundColor(Color("Text"))
        .padding(.leading)
      
      Text(text)
        .foregroundColor(Color("Text"))
        .padding()
      
      Spacer()
    }
    .background(gradient)
    .cornerRadius(10)
  }
}

#Preview
{
  MessageView(text: "Dette er en melding").padding()
}
