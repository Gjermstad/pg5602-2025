//
//  TaskEdit.swift
//  Flow
//
//  Created by Stig Højklint on 02/10/2025.
//

import SwiftUI

struct TaskEdit: View
{
  @Environment(\.dismiss) var dismiss
  var task: TaskModel
  
  @State private var title: String
  @State private var notes: String
  @State private var startDate: Date
  @State private var dueDate: Date
  @State private var priority: Int
  @State private var status: TaskStatus
  @State private var archived: Bool
  
  @State private var showStartDate: Bool = false
  @State private var showDueDate: Bool = false
  
  init(task: TaskModel)
  {
    self.task = task
    
    _title = .init(initialValue: task.title)
    _startDate = .init(initialValue: task.startDate)
    _dueDate = .init(initialValue: task.dueDate)
    _priority = .init(initialValue: task.priority)
    _status = .init(initialValue: task.status)
    _archived = .init(initialValue: task.archived)
    _notes = .init(initialValue: task.notes)
  }
  
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
          task.title = title
          task.notes = notes
          task.startDate = startDate
          task.dueDate = dueDate
          task.priority = priority
          task.status = status
          task.archived = archived
          
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
    TaskEdit(task: exampleTask)
  }
}
