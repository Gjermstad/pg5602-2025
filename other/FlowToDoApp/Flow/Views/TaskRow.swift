//
//  TaskRow.swift
//  Flow
//
//  Created by Stig Orla Sørli Højklint on 11/10/2025.
//

import SwiftUI

struct TaskRow: View
{
  var task: TaskModel
  
  var body: some View
  {
    HStack
    {
      Image("\(task.status.rawValue)")
        .resizable().scaledToFit()
        .frame(width: 60)
      
      VStack(alignment: .leading)
      {
        Text(task.title.count > maxTitle ? "\(task.title.prefix(maxTitle)) …" : task.title).font(.title)
       
        HStack
        {
          Text("⏳ \(task.dueDate.formatted(date: .abbreviated, time: .omitted))")
          
          let (symbol, color) = priorityIcon(task.priority)
          Image(systemName: symbol).foregroundColor(color).font(.title)
        }
      }
      .foregroundColor(Color("Text"))
      
      Spacer()
    }
  }
}

#Preview
{
  TaskRow(task: exampleTask).padding()
}
