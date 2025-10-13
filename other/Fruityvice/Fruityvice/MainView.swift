//
//  ContentView.swift
//  Fruityvice
//
//  Created by Stig Orla Sørli Højklint on 09/10/2025.
//

import SwiftUI

struct MainView: View
{
  @State private var fruits = [Fruit]()
  
  var body: some View
  {
    if fruits.isEmpty
    {
      VStack
      {
        Text("Det er ikke lastet ned noen frukt")
        Button("Last ned frukt")
        {
          Task
          {
            fruits = await getFruits()
          }
        }
        .buttonStyle(.borderedProminent)
      }
    }
    else
    {
      List(fruits)
      {
        fruit in
        
        VStack
        {
          Text(fruit.name)
        }
      }
    }
  }
}

#Preview
{
  MainView()
}
