//
//  ExerciseRow.swift
//  LifeStyle
//
//  Created by Stig Højklint on 08/09/2025.
//

import SwiftUI

struct ExerciseRow: View
{
  var exercise: ExerciseModel
  
  var body: some View
  {
    HStack
    {
      // Viser en avatar (første bokstav) basert på tittelen til øvelsen
      AvatarView(title: exercise.title)
      
      VStack(alignment: .leading)
      {
        // Viser tittel og notater, men avkorter teksten dersom den er for lang
        Text(exercise.title.count > maxTitle ? "\(exercise.title.prefix(maxTitle)) …" : exercise.title).font(.title2)
        Text(exercise.notes.count > maxNotes ? "\(exercise.notes.prefix(maxNotes)) …" : exercise.notes)
      }
      
      // Skyver innholdet til venstre ved å legge inn fleksibelt tomrom
      Spacer()
      
      // Hvis øvelsen er merket som favoritt (starred = true), vises en gul stjerne til høyre.
      if (exercise.favorite)
      {
        Image(systemName: "star.fill").font(.title).foregroundColor(.yellow)
      }
    }
    .swipeActions(edge: .leading, allowsFullSwipe: true)
    {
      // Sveip til venstre → merk som favoritt
      Button
      {
        exercise.favorite.toggle()
        exercise.update = .now
      }
      label:
      {
        Image(systemName: "star.fill").tint(.yellow)
      }
    }
    .swipeActions(edge: .trailing, allowsFullSwipe: false)
    {
      // Sveip til høyre → arkiver
      Button
      {
        exercise.trashbin = true
        exercise.update = .now
      }
      label:
      {
        Image(systemName: "trash").tint(.red)
      }
    }
  }
}

#Preview
{
  ExerciseRow(exercise: exercise).padding()
}
