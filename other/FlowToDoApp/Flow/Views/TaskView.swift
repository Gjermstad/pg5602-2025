//
//  TaskView.swift
//  Flow
//
//  Created by Stig Orla Sørli Højklint on 04/10/2025.
//

import SwiftData
import SwiftUI

struct TaskView: View
{
  @State private var search = ""
  
  @Query(filter: #Predicate<TaskModel>{!$0.archived},
         sort:[SortDescriptor(\TaskModel.dueDate, order: .forward),
               SortDescriptor(\TaskModel.priority, order: .reverse)]) private var tasks: [TaskModel]
  
  var body: some View
  {
    var filterTasks: [TaskModel]
    {
      if search.isEmpty
      {
        return tasks
      }
      else
      {
        return tasks.filter { $0.title.lowercased().contains(search.lowercased()) }
      }
    }
    
    Group
    {
      if filterTasks.isEmpty
      {
        if search.isEmpty
        {
          EmptyView(title: "Ingen arkiverte oppgaver", notes: "Du har ikke arkivert noen oppgaver ennå.")
        }
        else
        {
          EmptyView(title: "Ingen oppgaver funnet", notes: "Vi fant ingen oppgaver som matcher søket ditt.")
        }
      }
      else
      {
        List(filterTasks)
        {
          task in
          
          NavigationLink
          {
            TaskEdit(task: task)
          }
          label:
          {
            TaskRow(task: task)
          }
          .listRowSeparator(.hidden)
          .listRowBackground(Color.clear)
          .swipeActions(edge: .trailing, allowsFullSwipe: false)
          {
            Button(role: .destructive)
            {
              task.archived = true
              task.updatedDate = .now
            }
            label:
            {
              Image(systemName: "trash.fill")
            }
          }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
      }
    }
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
      
      ToolbarItem(placement: .bottomBar)
      {
        TextField(" Søk", text: $search)
          .padding(8)
          .frame(minWidth: 200)
          .background(Color("Search"))
          .cornerRadius(10)
      }
      
      ToolbarItem(placement: .bottomBar)
      {
        NavigationLink
        {
          TrashView()
        }
        label:
        {
          Image(systemName: "trash.fill").font(.title)
        }
      }
    }
  }
}

#Preview
{
  NavigationStack
  {
    NavigationStack
    {
      TaskView()
    }
  }
}
