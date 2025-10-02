//
//  TaskAdd.swift
//  Flow
//
//  Created by Kenneth Andre Bettum Gjermstad on 02/10/2025.
//

import SwiftUI

struct TaskAdd: View
{
  // Kobler oss til databasen vår med lese og skrivetilgang
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) private var dismiss
  
  @State private var title: String = ""
  @State private var notes: String = ""
  
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
        let newTask = TaskModel(title: title, notes: notes)
        context.insert(newTask)
        dismiss()
      }
      .buttonStyle(.borderedProminent)
      .disabled(title == "")
    }
  }
}

#Preview {
  TaskAdd()
}
