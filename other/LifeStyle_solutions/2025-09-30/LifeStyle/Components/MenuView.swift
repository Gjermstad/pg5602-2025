//
//  MenuView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 13/09/2025.
//

import SwiftUI

struct MenuView: View
{
  @Binding var showSheet: Bool
  
  var body: some View
  {
    // Menu lager en nedtrekksmeny som vises når brukeren trykker på ikonet.
    // Her får brukeren valg som fører til ulike Views via NavigationLink,
    // samt en knapp (Søk) som åpner et ark (sheet).
    Menu
    {
      NavigationLink(destination: ExerciseView())
      {
        Label("🏋️‍♀️ Trening", systemImage: "figure.walk")
      }
      
      NavigationLink(destination: NutritionView())
      {
        Label("🥗 Kosthold", systemImage: "leaf")
      }
      
      NavigationLink(destination: WellnessView())
      {
        Label("🧘‍♀️ Velvære", systemImage: "heart")
      }
      
      NavigationLink(destination: GoalView())
      {
        Label("🎯 Mål", systemImage: "target")
      }
      
      Divider()
      
      Button
      {
        showSheet.toggle()
      }
      label:
      {
        Label("👀 Søk", systemImage: "magnifyingglass.circle")
      }
    }
    label:
    {
      Image(systemName: "square.grid.2x2").font(.title)
    }
  }
}

#Preview
{
  MenuView(showSheet: .constant(true))
}
