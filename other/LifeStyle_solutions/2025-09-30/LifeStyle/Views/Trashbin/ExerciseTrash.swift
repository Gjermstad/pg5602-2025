//
//  ExerciseTrash.swift
//  LifeStyle
//
//  Created by Stig Højklint on 30/09/2025.
//

import SwiftData
import SwiftUI

struct ExerciseTrash: View
{
  @Query(sort: \ExerciseModel.title, order: .forward) private var exercises: [ExerciseModel]
  @Environment(\.modelContext) private var context
  
  var body: some View
  {
    let filtered = exercises.filter{$0.trashbin}
    
    NavigationStack
    {
      Group
      {
        if filtered.isEmpty
        {
          EmptyView(title: "Ingen arkiverte øvelser", notes: "Du har ikke sendt noen til søppelbøtta.")
        }
        else
        {
          List
          {
            MessageView(text: "Sveip mot venstre for å velge om du vil gjenopprette øvelsen eller slette den permanent.")
              .listRowSeparator(.hidden)
            
            ForEach(filtered)
            {
              exercise in
              
              HStack
              {
                // AvatarView viser første bokstav i tittelen.
                AvatarView(title: exercise.title)
                
                VStack(alignment: .leading)
                {
                  // Viser tittelen på kategorien.
                  // Hvis tittelen er for lang, forkortes den med "…"
                  Text(exercise.title.count > maxTitle ? "\(exercise.title.prefix(maxTitle)) …" : exercise.title).font(.title2)
                  
                  // Viser notatene på samme måte med begrenset lengde.
                  Text(exercise.notes.count > maxNotes ? "\(exercise.notes.prefix(maxNotes)) …" : exercise.notes)
                }
                
                Spacer()
                
                // Viser en gul stjerne dersom kategorien er markert som favoritt.
                if (exercise.favorite)
                {
                  Image(systemName: "star.fill").font(.title).foregroundColor(.yellow)
                }
              }
              .swipeActions(edge: .trailing, allowsFullSwipe: false)
              {
                Button(role: .destructive)
                {
                  context.delete(category)
                }
                label:
                {
                  Image(systemName: "trash.fill")
                }
                
                Button(role: .cancel)
                {
                  exercise.trashbin = false
                  exercise.update = .now
                }
                label:
                {
                  Image(systemName: "tray.and.arrow.up.fill")
                }
              }
            }
            .listRowSeparator(.hidden)
          }
          .listStyle(.plain)
        }
      }
      .navigationTitle("Arkiverte øvelser")
    }
  }
}

#Preview
{
  ExerciseTrash()
}
