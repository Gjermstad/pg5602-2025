//
//  StarView.swift
//  Beacon
//
//  Created by Stig Højklint on 24/10/2025.
//

import SwiftUI

enum Type: Int
{
  case single = 0
  case multiple = 1
}

struct ShowStar: View
{
  var type: Type
  var rating: [Int]
  
  init(_ type: Type, _ rating: [Int])
  {
    self.type = type
    self.rating = rating
  }
  
  var body: some View
  {
   
  }
}

#Preview
{
  ShowStar(.single, [1,3,1,5,5,2])
}
