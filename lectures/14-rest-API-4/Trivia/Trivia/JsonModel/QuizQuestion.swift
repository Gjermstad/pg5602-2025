//
//  Question.swift
//  Trivia
//
//  Created by Kenneth Andre Bettum Gjermstad on 16/10/2025.
//

import Foundation

struct QuizResponse: Decodable
{
  let responseCode: Int
  let results: [QuizQuestion]
  
  enum CodingKeys: String, CodingKey
  {
    case responseCode = "response_code"
    case results
  }
}

struct QuizQuestion: Decodable, Identifiable
{
  let id = UUID() // generert lokalt, ikke fra JSON
  let type: String
  let difficulty: String
  let category: String
  let question: String
  let correctAnswer: String
  let incorrectAnswers: [String]
  
  enum CodingKeys: String, CodingKey
  {
    case type
    case difficulty
    case category
    case question
    case correctAnswer = "correct_answer"
    case incorrectAnswers = "incorrect_answers"
  }
}

//
// ⚠️ Henter spørsmål fra API server
//

func fetchQuiz() async -> [QuizQuestion]
{
  // Setter sammen URL-en til API-endepunktet
  let url = "https://opentdb.com/api.php?amount=10"
  print("🛜 \(url)")
  
  // Prøver å få kontakt med API Server
  guard let connection = URL(string: url) else
  {
    print("⚠️ Ugyldig URL, kan ikke koble til server.")
    return [QuizQuestion]()
  }
  
  do
  {
    // Prøver å laste ned data fra API Server
    let (data, response) = try await URLSession.shared.data(from: connection)
    print("🤖 Antall byte lasted ned: \(data)")
    
    // Sjekker først at responsen fra URLSession faktisk er en HTTP-respons
    if let httpResponse = response as? HTTPURLResponse
    {
      // Henter statuskoden fra HTTP-responsen (f.eks. 200, 404, 500)
      let status = httpResponse.statusCode
      
      // Sjekker om statuskoden er innenfor gyldig område 200–299
      if (200...299).contains(status)
      {
        print("✅ Serveren svarte med gyldig status: \(status)\n")
      }
      else
      {
        print("⚠️ Serveren svarte med feilkode: \(status)\n")
        return [QuizQuestion]()
      }
    }
    
    // Prøver å dekode data fra API Server - vi sier vi kun ønsker results fra QuizResponse
    return try JSONDecoder().decode(QuizResponse.self, from: data).results
  }
  catch
  {
    print ("⚠️ Beklager! Feil ved nedlasting eller dekoding av data: \(error.localizedDescription)\n")
  }
  
  return [QuizQuestion]()
}

