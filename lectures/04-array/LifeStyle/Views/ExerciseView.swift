//
//  ExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 30/08/2025.
//

import SwiftUI

struct ExerciseView: View
{
  @State private var exercises: [String] = ["Løping", "Styrketrening", "Pilates","HIIT"]
  @State private var showSheet = false
  
  var body: some View
  {
    NavigationStack
    {
      Group
      {
        if exercises.isEmpty
        {
          EmptyView(title: "Ingen økter registrert", notes: "Vennligst opprett en ny økt ved å\ntrykke på pluss knappen.")
        }
        else
        {
          List(exercises, id: \.self)
          {
            exercise in Text(exercise)
          }
        }
      }
      .navigationTitle("Trening")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar
      {
        ToolbarItem(placement: .topBarTrailing)
        {
          Button
          {
            showSheet.toggle()
          }
          label:
          {
            Image(systemName: "plus.circle.fill").font(.title2).tint(.orange)
          }
        }
      }
      .sheet(isPresented: $showSheet)
      {
        AddExerciseView(trening: $exercises)
      }
    }
  }
}

#Preview
{
  ExerciseView()
}
