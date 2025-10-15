//
//  MainView.swift
//  Flow
//
//  Created by Stig Højklint on 29/09/2025.
//

import SwiftData
import SwiftUI

struct MainView: View
{
  var body: some View
  {
    @Environment(\.colorScheme) var colorScheme
    
    NavigationStack
    {
      GeometryReader
      {
        geo in
        
        ZStack
        {
          Image("Background")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .frame(width: geo.size.width, height: geo.size.height)
          
          Color("Overlay").opacity(0.5).ignoresSafeArea()
          
          TaskView()
        }
      }
      .navigationTitle("Flow")
      .toolbarTitleDisplayMode(.inlineLarge)
    }
  }
}

#Preview
{
  MainView().modelContainer(for: TaskModel.self, inMemory: true)
}
