//
//  ExerciseEdit.swift
//  LifeStyle
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct ExerciseEdit: View
{
  @Binding var exercise: String
  
  var body: some View
  {
    TextField("Tittel på trening", text: $exercise)
  }
}

#Preview {
  ExerciseEdit(exercise: .constant("abc"))
}
