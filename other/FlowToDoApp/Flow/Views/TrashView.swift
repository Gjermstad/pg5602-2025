//
//  ExerciseTrash.swift
//  LifeStyle
//
//  Created by Stig Højklint on 30/09/2025.
//

import SwiftData
import SwiftUI

struct TrashView: View
{
  @Query(filter: #Predicate<TaskModel>{$0.archived}) private var tasks: [TaskModel]
  @Environment(\.modelContext) private var context
  
  var body: some View
  {
    Group
    {
      if tasks.isEmpty
      {
        EmptyView(title: "Søppelbøtten er tom", notes: "Du har ikke sendt noen oppgaver til søppelbøtten.")
      }
      else
      {
        List
        {
          MessageView(text: "Sveip mot venstre for å velge om du vil gjenopprette oppgavene eller slette permanent.")
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
          
          ForEach(tasks)
          {
            task in
            
            TaskRow(task: task)
              .listRowBackground(Color.clear)
              .listRowSeparator(.hidden)
              .swipeActions(edge: .trailing, allowsFullSwipe: false)
            {
              Button(role: .destructive)
              {
                context.delete(task)
              }
              label:
              {
                Image(systemName: "trash.fill")
              }
              
              Button(role: .cancel)
              {
                task.archived = false
                task.updatedDate = .now
              }
              label:
              {
                Image(systemName: "tray.and.arrow.up.fill")
              }
            }
          }
        }
        .listStyle(.plain)
      }
    }
    .background(gradient)
    .navigationTitle("Søppelbøtte")
    .scrollContentBackground(.hidden)
  }
}

#Preview
{
  NavigationStack
  {
    TrashView()
  }
}
