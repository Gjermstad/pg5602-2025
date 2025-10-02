//
//  MainView.swift
//  Flow
//
//  Created by Stig Højklint on 29/09/2025.
//

import SwiftData
import SwiftUI

struct MainView: View
{
  // Knytter oss til tabellen TaskModel, @Query er kun readonly, enveis
  @Query private var tasks: [TaskModel]
  
  // gir oss tilgang til databasen så vi kan skrive til den, vanlig å kalle den context
  @Environment(\.modelContext) private var context
  
  var body: some View
  {
    NavigationStack
    {
      List
      {
        Button("Ny oppgave")
        {
          let newTask = TaskModel(title: "Ny oppgave \(Date().formatted(date: .omitted, time: .standard))")
          newTask.notes = "Her kommer notater"
          newTask.dueDate = Date().addingTimeInterval(60*60*24)
          
          context.insert(newTask)
        }
        .buttonStyle(.borderedProminent)
        
        ForEach(tasks)
        {
          task in
          
          NavigationLink()
          {
            
          }
        label:
          {
            Text(task.title)
          }
        }
      }
      .navigationTitle("Oppgaver")
      .listStyle(.plain)
    }
  }
}

#Preview
{
  // Vi må injisere databasen TaskModel for at preview skal ha tilgang
  MainView().modelContainer(for: TaskModel.self)
}
