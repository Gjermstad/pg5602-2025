//
//  ContentView.swift
//  FruityVice
//
//  Created by Kenneth Andre Bettum Gjermstad on 15/10/2025.
//

import SwiftUI

struct MainView: View
{
  @State private var fruits = [Fruit]()
  
  var body: some View
  {
    
    NavigationStack
    {
      List(fruits)
      {
        row in
        
        VStack(alignment: .leading)
        {
          Text("ID: #\(row.id)")
          Text(row.name).font(.headline)
          Text("Carbohydrates: " + row.nutritions.carbohydrates.description + "g / 100g")
        }
      }
      .navigationTitle("FruityVice Fruits")
      .toolbar
      {
        ToolbarItem(placement: .bottomBar)
        {
          Button("Last ned frukt")
          {
            Task
            {
              fruits = await fetchFruits()
            }
          }
        }
      }
    }
  }
}

#Preview {
  MainView()
}
