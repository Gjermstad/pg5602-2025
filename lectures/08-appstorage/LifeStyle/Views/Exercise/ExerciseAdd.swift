//
//  AddExerciseView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 03/09/2025.
//

import SwiftUI
import SwiftData

struct ExerciseAdd: View
{
  @Environment(\.modelContext) private var context
  @Query private var categories: [Category]
  
  // Dismiss gir tilgang til en funksjon fra SwiftUI sitt miljø som kan lukke
  // det gjeldende View. Du kaller bare dismiss() når du vil lukke visningen.
  @Environment(\.dismiss) private var dismiss
  
  @State private var title = ""
  @State private var notes = ""
  @State private var category: Category?
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        TextField("Tittel", text: $title)
        
        Picker("Velg kategori", selection: $category)
        {
          Text("Ingen kategori").tag(Category?.none)
          
          ForEach(categories)
          {
            category in Text(category.title).tag(Category?.some(category))
          }
        }
        
        Section("Notater")
        {
          TextEditor(text: $notes).frame(minHeight: 200)
        }
      }
      .navigationBarTitle("Ny 🏋️‍♀️")
      .navigationBarBackButtonHidden(true)
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
            // Oppretter et nytt ellement og lagrer den
            let exercise = Exercise()
            exercise.title = title
            exercise.notes = notes
            exercise.category = category
            
            context.insert(exercise)
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
  ExerciseAdd().modelContainer(for: [Exercise.self])
}


