//
//  QuestionView.swift
//  Trivia
//
//  Created by Stig Højklint on 12/11/2025.
//

import SwiftUI

struct QuestionView: View
{
  @EnvironmentObject var trivia: TriviaModel
  
  var body: some View
  {
    Button("Ferdig")
    {
      trivia.state = .finnish
    }
    .buttonStyle(.borderedProminent)
  }
}

#Preview
{
  QuestionView()
}
