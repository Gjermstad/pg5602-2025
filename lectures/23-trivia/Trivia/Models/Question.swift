//
//  Question.swift
//  Trivia
//
//  Created by Stig Orla Sørli Højklint on 20/10/2025.
//

import Foundation

//
// En struktur som representerer svaret fra API-et når man henter spørsmål
//
struct QuestionResponse: Decodable
{
  let responseCode: Int
  let questions: [Question]

  enum CodingKeys: String, CodingKey
  {
    case responseCode = "response_code"
    case questions = "results"
  }
}

//
// En struktur som representerer ett enkelt spørsmål i API-et
//
struct Question: Decodable, Identifiable
{
  let id = UUID()
  let type: String        // multiple, boolean
  let difficulty: String  // easy, medium, hard
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
  
  var allAnswers: [String]
  {
    ([correctAnswer] + incorrectAnswers).shuffled()
  }
}
