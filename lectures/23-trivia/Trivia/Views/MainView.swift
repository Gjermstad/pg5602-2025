//
//  ContentView.swift
//  Trivia
//
//  Created by Stig Højklint on 20/10/2025.
//

import SwiftUI

struct MainView: View
{
  @EnvironmentObject var trivia: TriviaModel
  
  var body: some View
  {
    NavigationStack
    {
      ZStack
      {
        BackgroundView()
        
        switch trivia.state
        {
        case .idle:
          StartView()
        case .loading:
          LoadingView(false)
        case .error(let text):
          MessageView(text: text)
        case .success:
          QuestionView()
        case .finnish:
          SummaryView()
        }
      }
      .navigationTitle("Brainbusters")
    }
  }
}

#Preview
{
  MainView().environmentObject(TriviaModel())
}
