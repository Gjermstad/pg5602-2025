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

func fetchQuiz(amount: Int, category: Int = 15) async -> QuizResponse
{
  // Setter sammen URL-en til API-endepunktet
  var url = "https://opentdb.com/api.php"
  
  if amount < 1
  {
    url += "?amount=5"
  }
  else
  {
    url += "?amount=\(amount)"
  }
  
  url += "&category=\(category)"
  
  print("🛜 URL: \(url)")
  
  // Prøver å få kontakt med API Server
  guard let connection = URL(string: url) else
  {
    print("⚠️ Ugyldig URL, kan ikke koble til server.")
    return QuizResponse(responseCode: -666, results: [])
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
        return QuizResponse(responseCode: -555, results: [])
      }
    }
    
    // Prøver å dekode data fra API Server - vi sier vi kun ønsker results fra QuizResponse
    return try JSONDecoder().decode(QuizResponse.self, from: data)
  }
  catch
  {
    print ("⚠️ Beklager! Feil ved nedlasting eller dekoding av data: \(error.localizedDescription)\n")
  }
  
  return QuizResponse(responseCode: -444, results: [])
}

// liten hjelpefunksjon for å “unescape” HTML
func htmlDecoded(_ s: String) -> String {
  (try? NSAttributedString(
    data: Data(s.utf8),
    options: [.documentType: NSAttributedString.DocumentType.html,
              .characterEncoding: String.Encoding.utf8.rawValue],
    documentAttributes: nil
  ).string) ?? s
}
