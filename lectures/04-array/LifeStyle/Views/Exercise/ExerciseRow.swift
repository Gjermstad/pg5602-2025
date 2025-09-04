//
//  ExerciseRow.swift
//  LifeStyle
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct ExerciseRow: View
{
  @State var exercise: String
  
  var body: some View
  {
    Text(exercise)
  }
}

#Preview {
  ExerciseRow(exercise: "abc")
}
