//
//  TaskEdit.swift
//  Flow
//
//  Created by Kenneth Andre Bettum Gjermstad on 02/10/2025.
//

import SwiftUI

struct TaskEdit: View
{
  // For å kunne lagre task oppgaven vi gir Viewet
  var task: TaskModel
  
  var body: some View
  {
    Text("TaskEdit")
  }
}

#Preview {
  TaskEdit(task: exampleTask)
}
