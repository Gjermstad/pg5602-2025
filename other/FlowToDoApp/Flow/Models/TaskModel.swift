//
//  TaskModel.swift
//  Flow
//
//  Created by Stig Højklint on 29/09/2025.
//

import Foundation
import SwiftData

enum TaskStatus: Int, Codable
{
  case notStarted
  case inProgress
  case almostDone
  case completed
}

@Model final class TaskModel
{
  var id: UUID
  var title: String
  var notes: String
  var startDate: Date
  var dueDate: Date
  var priority: Int
  var status: TaskStatus
  var archived: Bool
  var createdDate: Date
  var updatedDate: Date
  
  init(title: String, notes: String = "")
  {
    self.id = UUID()
    self.title = title
    self.notes = notes
    self.startDate = .now
    self.dueDate = .now
    self.priority = 0
    self.status = .notStarted
    self.archived = false
    self.createdDate = .now
    self.updatedDate = .now
  }
}

let exampleTask = TaskModel(title: "Eksempel oppgave")
