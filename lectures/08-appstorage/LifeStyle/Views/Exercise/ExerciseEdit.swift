//
//  ExerciseEdit.swift
//  LifeStyle
//
//  Created by Stig Højklint on 08/09/2025.
//

import SwiftUI
import SwiftData

struct ExerciseEdit: View
{
  @Query private var categories: [Category]
  
  // Dismiss gir tilgang til en funksjon fra SwiftUI sitt miljø som kan lukke
  // det gjeldende View. Du kaller bare dismiss() når du vil lukke visningen.
  @Environment(\.dismiss) private var dismiss
  
  var exercise: Exercise
  
  @State private var title: String
  @State private var notes: String
  @State private var category: Category?
  
  // Vi bruker enten init() eller onAppear når vi skal hente ut data når Viewet lastes inn
  init(exercise: Exercise)
  {
    self.exercise = exercise
    _title = .init(initialValue: exercise.title)
    _notes = .init(initialValue: exercise.notes)
    _category = .init(initialValue: exercise.category)
  }
  
  var body: some View
  {
    NavigationStack
    {
      Form
      {
        TextField("Tittel", text: $title)
        
        Picker("Kategori", selection: $category)
        {
          Text("Ingen kategori").tag(Category?.none)
          
          ForEach(categories)
          {
            category in Text(category.title).tag(Category?.some(category))
          }
        }
        
        Section("Notater")
        {
          TextEditor(text: $notes).frame(minHeight: 150)
        }
      }
      .navigationBarTitle("Redigere 🏋️‍♀️")
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden()
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
            exercise.title = title
            exercise.notes = notes
            exercise.category = category
            dismiss()
          }
        }
      }
    }
  }
}

#Preview
{
  ExerciseEdit(exercise: exercise1)
}
