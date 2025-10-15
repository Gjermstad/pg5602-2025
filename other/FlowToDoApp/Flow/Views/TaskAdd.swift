//
//  TaskAdd.swift
//  Flow
//
//  Created by Stig Højklint on 02/10/2025.
//

import SwiftUI

struct TaskAdd: View
{
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var context
  
  @State private var title: String = ""
  @State private var notes: String = ""
  @State private var startDate: Date = Date()
  @State private var dueDate: Date = Date()
  @State private var priority: Int = 0
  @State private var status: TaskStatus = .notStarted
  @State private var archived: Bool = false
  
  @State private var showStartDate: Bool = false
  @State private var showDueDate: Bool = false
  
  var body: some View
  {
    Form
    {
      Group
      {
        TextField("Tittel", text: $title)
        
        Section("Prioritet")
        {
          Picker("", selection: $priority)
          {
            Text("LAV").tag(0)
            Text("MIDDELS").tag(1)
            Text("HØY").tag(2)
          }
          .pickerStyle(.segmented)
        }
        
        HStack
        {
          Text("Startdato:")
          Spacer()
          
          Button
          {
            showStartDate = true
          }
          label:
          {
            Text(startDate.formatted(date: .abbreviated, time: .omitted))
          }
          .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showStartDate)
        {
          DateView(selectedDate: $startDate, isPresented: $showStartDate)
        }
        
        HStack
        {
          Text("Utløpsdato:")
          Spacer()
          
          Button
          {
            showDueDate = true
          }
          label:
          {
            Text(dueDate.formatted(date: .abbreviated, time: .omitted))
          }
          .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showDueDate)
        {
          DateView(selectedDate: $dueDate, isPresented: $showDueDate)
        }
        
        Section("Status")
        {
          Picker(selection: $status)
          {
            Text("Ikke startet").tag(TaskStatus.notStarted)
            Text("Startet").tag(TaskStatus.inProgress)
            Text("Snart ferdig").tag(TaskStatus.almostDone)
            Text("Ferdig").tag(TaskStatus.completed)
          }
          label:{}.pickerStyle(.inline)
        }
        
        Toggle(isOn: $archived)
        {
          Text("🗑️ Send til søppelbøtten")
        }
        
        Section("Notater")
        {
          TextEditor(text: $notes).frame(minHeight: 100)
        }
      }
      .listRowBackground(Color("Component"))
    }
    .toolbar
    {
      ToolbarItem(placement: .topBarTrailing)
      {
        Button("Lagre")
        {
          let newTask = TaskModel(title: title, notes: notes)
          
          newTask.startDate = startDate
          newTask.dueDate = dueDate
          newTask.priority = priority
          newTask.status = status
          newTask.archived = archived
          
          context.insert(newTask)
          dismiss()
        }
        .disabled(title.isEmpty)
      }
    }
    .background(gradient)
    .navigationTitle("Ny oppgave")
    .scrollContentBackground(.hidden)
  }
}

#Preview
{
  NavigationStack
  {
    TaskAdd()
  }
}
