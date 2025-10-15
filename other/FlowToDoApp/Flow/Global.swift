//
//  Global.swift
//  Flow
//
//  Created by Stig Højklint on 07/10/2025.
//

import Foundation
import SwiftUI

// Maks synlig lengde på tittel og notater
let maxTitle = 20
let maxNotes = 60

let gradient = LinearGradient(colors: [Color("Top"), Color("Bottom")],
                              startPoint: .topLeading,
                              endPoint: .bottomTrailing)

let priorityIcon: (Int) -> (String, Color) =
{
  priority in
  
  switch priority
  {
    case 0: return ("tortoise.fill", Color("Low"))
    case 1: return ("alarm.fill", Color("Middel"))
    case 2: return ("hare.fill", Color("High"))
    default: return ("questionmark.diamond.fill", Color("Text"))
  }
}
