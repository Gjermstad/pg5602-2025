//
//  ContentView.swift
//  Trivia
//
//  Created by Kenneth Andre Bettum Gjermstad on 16/10/2025.
//

import SwiftUI

struct MainView: View
{
  @State private var questions = [QuizQuestion]()
  
  var body: some View
  {
    NavigationStack
    {
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
              questions = await fetchQuiz()
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
