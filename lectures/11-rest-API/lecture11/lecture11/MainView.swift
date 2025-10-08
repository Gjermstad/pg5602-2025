//
//  ContentView.swift
//  lecture11
//
//  Created by Kenneth Andre Bettum Gjermstad on 08/10/2025.
//

import SwiftUI

struct MainView: View
{
  @State private var quotes: [Quote] = []
  
  var body: some View
  {
    NavigationStack
    {
      List
      {
        
      }
      .navigationTitle("Breaking Bad")
      .toolbar
      {
        ToolbarItem(placement: .topBarTrailing)
        {
          
        }
      }
    }
  }
}

#Preview {
  MainView()
}
