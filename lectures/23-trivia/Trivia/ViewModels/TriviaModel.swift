//
//  TriviaModel.swift
//  Trivia
//
//  Created by Stig Orla Sørli Højklint on 10/11/2025.
//

import Foundation

//
//
//
enum TriviaType: String, Decodable
{
  case multiple
  case boolean
}

//
// ...
//
enum TriviaLevel: String, Decodable
{
  case easy
  case medium
  case hard
}

//
// ...
//
enum TriviaState
{
  case idle
  case loading
  case success
  case finnish
  case error(String)
}

//
// ...
//
@MainActor final class TriviaModel: ObservableObject
{
  // @Published betyr at endringer vil publisere endringer på variablen og Views som bruker data vil automatisk oppdatere seg
  @Published var questions: [Question] = []
  @Published var type: TriviaType = .multiple
  @Published var level: TriviaLevel = .easy
  @Published var category: Int = 0
  @Published var number: Int = 10
  
  @Published var state: TriviaState = .idle
  @Published var correctAnswers: Int = 0
  @Published var currentIndex: Int = 0
  
  // Totalt antall spørsmål i arrayet
  var total: Int { questions.count }
  
  //
  // Henter spørsmål fra tabellen
  //
  func getQuestion()
  {
    
  }
  
  //
  // Henter spørsmål fra Trivia API server
  //
  func loadQuestions() async
  {
    state = .loading
    
    // defer sørger for at denne koden alltid kjøres til slutt, selv om annen kode kaster en error
    defer
    {
      if case .loading = state { state = .idle }
    }
    
    var address = URLComponents(string: "https://opentdb.com/api.php")!
    var queries = [URLQueryItem]()
    queries.append(URLQueryItem(name: "amount", value: "\(number)"))
    queries.append(URLQueryItem(name: "category", value: "\(category)"))
    address.queryItems = queries
    
    guard let url = address.url else
    {
      state = .error("⚠️ Ugyldig URL – sjekk parametrene.")
      return
    }
    
    do
    {
      let (data, _) = try await URLSession.shared.data(from: url)
      let response = try JSONDecoder().decode(QuestionResponse.self, from: data)
      
      questions = response.questions
      state = .success
    }
    catch
    {
      state = .error("Feil ved nedlasting av data: \(error.localizedDescription)")
    }
  }
}
