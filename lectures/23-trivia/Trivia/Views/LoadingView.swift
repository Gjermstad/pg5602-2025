//
//  LoadingView.swift
//  Beacon
//
//  Created by Stig Orla Sørli Højklint on 09/11/2025.
//

import SwiftUI

struct LoadingView: View
{
  var showBackground: Bool

  init(_ showBackground: Bool = true)
  {
    self.showBackground = showBackground
  }

  var body: some View
  {
    if showBackground
    {
      VStack(spacing: 20)
      {
        ProgressView().scaleEffect(2)
        Text("Laster ned data ...").font(.headline)
      }
      .padding(20)
      .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
      .shadow(radius: 8)
    }
    else
    {
      VStack(spacing: 20)
      {
        ProgressView().scaleEffect(2)
        Text("Laster ned data ...").font(.headline)
      }
      .background(Color.clear)
    }
  }
}

#Preview
{
  LoadingView()
}
