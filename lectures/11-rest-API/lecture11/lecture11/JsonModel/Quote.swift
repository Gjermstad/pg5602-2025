//
//  Quote.swift
//  lecture11
//
//  Created by Kenneth Andre Bettum Gjermstad on 08/10/2025.
//

import Foundation

// Vi kunne brukt Identifiable istedenfor Hashable og lagt til et ID-felt ala: "var id: UUID = UUID()"
struct Quote: Decodable, Hashable
{
  let quote: String
  let author: String
}
