//
//  AddExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 03/09/2025.
//

import SwiftUI

struct ExerciseAdd: View
{
  // @EnvironmentObject brukes når et View skal hente en delt data-kilde
  // som er injisert høyere opp i hierarkiet.
  // Her betyr det at ExerciseAdd forventer å finne en ExerciseStore
  // som allerede er lagt inn i environment i MainView eller i appen.
  @EnvironmentObject var store: ExerciseStore
  
  // Dismiss gir tilgang til en funksjon fra SwiftUI sitt miljø som kan lukke
  // det gjeldende View. Du kaller bare dismiss() når du vil lukke visningen.
  @Environment(\.dismiss) private var dismiss
  
  @State private var title = ""
  @State private var notes = ""
  @State private var level: Level = .easy
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        TextField("Tittel", text: $title)
        TextEditor(text: $notes)
          .frame(minHeight: 200)
        Picker("Vanskelighetsgrad", selection: $level)
          {
            
          }
      }
      .navigationBarTitle("Ny 🏋️‍♀️")
      .toolbar
      {
        ToolbarItem(placement: .cancellationAction)
        {
          Button("Avbryt", role: .cancel)
          {
            dismiss()
          }
        }
        
        ToolbarItem(placement: .confirmationAction)
        {
          Button("Lagre")
          {
            // Oppretter et nytt ellement
            let exercise = Exercise(title: title, notes: notes)
            
            // Legger til ellement i tabellen/array
            store.exercises.append(exercise)
            dismiss()
          }
          .disabled(title.isEmpty)
        }
      }
    }
  }
}

#Preview
{
  // Når vi tester ExerciseAdd i Preview, må vi manuelt legge til en ExerciseStore.
  // Dette etterligner hvordan appen gjør det i LifeStyleApp (via environmentObject).
  // Uten denne linjen får vi feilmelding fordi ExerciseAdd krever en store fra environment.

  ExerciseAdd().environmentObject(ExerciseStore())
}


