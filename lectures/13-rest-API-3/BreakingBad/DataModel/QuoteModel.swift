//
//  QuoteModel.swift
//  BreakingBad
//
//  Created by Stig Orla Sørli Højklint on 13/10/2025.
//

import Foundation
import SwiftData

@Model final class QuoteModel
{
  var id = UUID()
  var quote: String
  var author: String
  
  init(quote: String, author: String)
  {
    self.quote = quote
    self.author = author
  }
}
  
