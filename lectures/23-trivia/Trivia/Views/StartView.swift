//
//  StartView.swift
//  Trivia
//
//  Created by Stig Højklint on 12/11/2025.
//

import SwiftUI

struct StartView: View
{
  @EnvironmentObject var trivia: TriviaModel
  
  @State private var categories: [Category] = []
  @State private var category: Int = 0
  @State private var number: Int = 10
  
  var body: some View
  {
    VStack(spacing: 30)
    {
      VStack(spacing: 8)
      {
        Image("Cognitio")
          .resizable()
          .frame(width: 200, height: 200)
        
        Text("Velg tema og antall spørsmål")
          .font(.subheadline)
          .foregroundColor(.secondary)
      }
      
      // MARK: - Kategorivalg
      VStack(alignment: .leading, spacing: 8)
      {
        Label("Kategori", systemImage: "list.bullet")
          .font(.headline)
        Picker("Velg kategori", selection: $category)
        {
          ForEach(categories)
          {
            category in Text(category.name).tag(category.id)
          }
        }
        .pickerStyle(.wheel)
        .frame(height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 12))
      }
      
      // MARK: - Antall spørsmål
      VStack(alignment: .leading, spacing: 8)
      {
        Label("Antall spørsmål", systemImage: "number.circle")
          .font(.headline)
        Stepper(value: $number, in: 1...50)
        {
          Text("\(number)")
            .font(.title2.bold())
            .frame(maxWidth: .infinity, alignment: .center)
        }
      }
      
      Spacer()
      
      // MARK: - Start-knapp
      Button
      {
        trivia.category = category
        trivia.number = number
        
        Task { await trivia.loadQuestions() }
        
      } label: {
        Label("Start quiz", systemImage: "play.circle.fill")
          .font(.title3.bold())
          .padding(.horizontal, 50)
          .padding(.vertical, 12)
          .frame(maxWidth: .infinity)
      }
      .buttonStyle(.borderedProminent)
      .tint(.blue)
      .controlSize(.large)
      .cornerRadius(16)
      .shadow(radius: 5)
      
    }
    .padding(.horizontal, 30)
    .padding(.top, 40)
    .task
    {
      categories = await fetchCategories()
    }
  }
  
}

#Preview
{
  StartView()
}
