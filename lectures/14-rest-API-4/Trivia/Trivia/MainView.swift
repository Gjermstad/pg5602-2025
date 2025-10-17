//
//  ContentView.swift
//  Trivia
//
//  Created by Kenneth Andre Bettum Gjermstad on 16/10/2025.
//

import SwiftUI

struct MainView: View
{
  @State private var response = QuizResponse(responseCode: -999, results: [])
  @State private var responseCode: Int = -999
  @State private var questions = [QuizQuestion]()
  
  var body: some View
  {
    NavigationStack
    {
      Text("Kode: \(responseCode)")
      
      List(questions)
      {
        row in
        
        VStack(alignment: .leading)
        {
          Text(row.question).bold()
          Text(row.correctAnswer)
        }
      }
      .toolbar
      {
        ToolbarItem(placement: .topBarTrailing)
        {
          Button
          {
            Task
            {
              response = await fetchQuiz(amount: 10, category: 15)
              
              responseCode = response.responseCode
              questions = response.results
            }
          }
        label:
          {
            Image(systemName: "cloud.fill")
          }
        }
      }
      .navigationTitle("Quiz fra Trivia")
    }
  }
}

#Preview {
  MainView()
}
