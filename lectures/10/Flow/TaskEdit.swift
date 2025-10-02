//
//  TaskEdit.swift
//  Flow
//
//  Created by Kenneth Andre Bettum Gjermstad on 02/10/2025.
//

import SwiftUI

struct TaskEdit: View
{
  @Environment(\.dismiss) var dismiss
  
  // For å kunne lagre task oppgaven vi gir Viewet
  // Det er en binding til databasen her selv om vi ikke har @Binding
  var task: TaskModel
  
  @State private var title: String
  @State private var notes: String
  
  // Vi bruker init for å sette feltene til å være fylt med data fra task som vi gir View'et
  init(task: TaskModel)
  {
    self.task = task
    _title = .init(initialValue: task.title)
    _notes = .init(initialValue: task.notes)
  }
  
  var body: some View
  {
    Form
    {
      TextField("Tittel", text: $title)
      
      Section("Notater")
      {
        TextEditor(text: $notes).frame(minHeight: 150)
      }
      
      Button("Lagre")
      {
        task.title = title
        task.notes = notes
        dismiss()
      }
      .buttonStyle(.borderedProminent)
      .disabled(title == "")
    }
  }
}

#Preview {
  TaskEdit(task: exampleTask)
}
