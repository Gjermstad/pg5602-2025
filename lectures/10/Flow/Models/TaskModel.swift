//
//  TaskModel.swift
//  Flow
//
//  Created by Stig Højklint on 29/09/2025.
//

import Foundation
import SwiftData

enum TaskPriority: Int, Codable
{
  case low = 0
  case medium = 1
  case high = 2
}

enum TaskStatus: Int, Codable
{
  case notStarted
  case inProgress
  case completed
}

@Model final class TaskModel
{
  var id: UUID
  var title: String
  var notes: String
  var createdAt: Date
  var dueDate: Date?
  var priority: TaskPriority
  var status: TaskStatus
  var orderIndex: Int
  var archived: Bool
  
  var category: CategoryModel?
  
  init(title: String, notes: String = "")
  {
    self.id = UUID()
    self.title = title
    self.notes = notes
    self.createdAt = .now
    self.dueDate = nil
    self.priority = .medium
    self.status = .notStarted
    orderIndex = 0
    archived = false
  }
}

let exampleTask = TaskModel(title: "Eksempel oppgave")
