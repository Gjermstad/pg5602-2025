//
//  SearchView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 08/09/2025.
//

import SwiftUI

struct SearchView: View
{
  var body: some View
  {
    NavigationStack
    {
      Form
      {
      }
      .navigationTitle("Søk")
      .navigationBarTitleDisplayMode(.inline)
    }
    .presentationDetents([.height(250), .height(500)])
    .presentationCornerRadius(25)
  }
}

#Preview
{
  SearchView()
}
