//
//  SummaryView.swift
//  Trivia
//
//  Created by Stig Højklint on 12/11/2025.
//

import SwiftUI

struct SummaryView: View
{
  @EnvironmentObject var trivia: TriviaModel
  
  var body: some View
  {
    VStack
    {
      Text("Oppsummering av resultat")
      Button("Start på nytt")
      {
        trivia.state = .idle
      }
      .buttonStyle(.borderedProminent)
    }
  }
}

#Preview {
  SummaryView()
}
