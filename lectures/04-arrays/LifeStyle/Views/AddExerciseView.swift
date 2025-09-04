//
//  AddExerciseView.swift
//  LifeStyle
//
//  Created by Kenneth Andre Bettum Gjermstad on 03/09/2025.
//

import SwiftUI

struct AddExerciseView: View
{
   @Binding var exercises: [String]
   @Binding var showSheet: Bool
   @State private var userInput: String = ""

    var body: some View
   {
        NavigationStack
       {
          Form
          {
             // "promt: Text()" fungerer som placeholder før man skriver inn noe
             TextField(text: $userInput, prompt: Text("Skriv inn navn på ny økt")) {}
          }
          .navigationTitle("Ny treningsøkt")
          .navigationBarTitleDisplayMode(.inline)
          // toolbar med ToolbarItem brukes for å legge til knappene på toppen av sheet'et
          .toolbar {
             ToolbarItem(placement: .cancellationAction) {
                Button("Avbryt") {
                   showSheet = false
                   userInput = ""
                }
             }
             ToolbarItem(placement: .confirmationAction) {
                Button("Lagre") {
                   exercises.append(userInput)
                   userInput = ""
                }
                .disabled(userInput == "")
             }
          }
       }
       // presentationDetents setter høyden når brukt som sheet, med to verdier setter du at høyden kan være mellom min og maks
       .presentationDetents([.height(250), .medium])
       .presentationCornerRadius(20)
    }
}
