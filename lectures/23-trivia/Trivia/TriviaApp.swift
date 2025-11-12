//
//  TriviaApp.swift
//  Trivia
//
//  Created by Stig Højklint on 20/10/2025.
//

import SwiftUI

@main struct TriviaApp: App
{
  @StateObject private var triviaModel = TriviaModel()

  var body: some Scene
  {
    WindowGroup
    {
      MainView().environmentObject(triviaModel)
    }
  }
}
