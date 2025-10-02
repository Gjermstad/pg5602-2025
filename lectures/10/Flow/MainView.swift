//
//  MainView.swift
//  Flow
//
//  Created by Stig Højklint on 29/09/2025.
//

import SwiftData
import SwiftUI

struct MainView: View {
  // Knytter oss til tabellen TaskModel, @Query er kun readonly, enveis
  @Query(filter: #Predicate<TaskModel>{$0.archived == false},
         sort: \TaskModel.title) private var tasks: [TaskModel]

  // gir oss tilgang til databasen så vi kan skrive til den, vanlig å kalle den context
  @Environment(\.modelContext) private var context

  var body: some View
  {
    NavigationStack
    {
      List(tasks)
      {
        task in

        NavigationLink
        {
          TaskEdit(task: task)
        }
        label:
        {
          // TaskRow()
          VStack{
            Text(task.title)
            Text(task.dueDate?.description ?? "Ingen DUE DATE")
            Text("Arkivert: " + task.archived.description)
          }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
          Button
          {
            task.archived = true
          }
        label:
          {
            Image(systemName: "trash.fill").tint(Color.red)
          }
        }
      }
      .navigationTitle("Oppgaver")
      .listStyle(.plain)
      .toolbar
      {
        ToolbarItem(placement: .topBarTrailing)
        {
          NavigationLink
          {
            TaskAdd()
          }
        label:
          {
            Image(systemName: "plus.circle.fill").font(.title)
          }
        }
      }
    }
  }
}

#Preview {
  // Vi må injisere databasen TaskModel for at preview skal ha tilgang
  MainView().modelContainer(for: TaskModel.self, inMemory: true)
}
