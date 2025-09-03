//
//  ExerciseView.swift
//  LifeStyle
//
//  Created by Kenneth Andre Bettum Gjermstad on 03/09/2025.
//

import SwiftUI

struct ExerciseView: View
{
   @State private var exercises: [String] = ["Løping", "Styrketrening", "Svømming", "Yoga", "Fjelltur", "Uttøying", "Pilates", "HIIT"]
   @State private var showSheet: Bool = false
   
   var body: some View
   {
      NavigationStack
      {
         // Group lar deg ha forskjellige tilstander med f.eks. if-setninger
         Group
         {
            // Alle vinduer som kan ha et tomt array/dataset bør du vise en et vindu med informasjon så brukeren får beskjed
            if exercises.isEmpty
            {
               EmptyView(title: "Ingen økter registrert", notes: "Vennligst kom deg på trening og lag en ny økt ved å trykke på `+`-knappen.")
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
         //navigationBarTitleDisplayMode gir liten tittel på toppen av siden istedenfor stor
         .navigationBarTitleDisplayMode(.inline)
         .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
               Button {
                  showSheet.toggle()
               } label: {
                  Image(systemName: "plus.circle.fill").font(.title2).tint(.orange)
               }
            }
         }
         .sheet(isPresented: $showSheet) {
            AddExerciseView(exercises: $exercises)
         }
      }
   }
}

#Preview {
   ExerciseView()
}
