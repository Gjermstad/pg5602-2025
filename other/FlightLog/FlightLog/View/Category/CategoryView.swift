//
//  CategoryView.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 07/10/2023.
//

import SwiftData
import SwiftUI

struct CategoryView: View 
{
  @AppStorage("isDarkMode") private var darkMode = false
  @Environment(\.dismiss) private var dismiss
  
  @Query(filter: #Predicate<Category>{category in category.trash == false},
         sort: \Category.name, order: .forward, animation: .default) private var categories: [Category]
  
  @State private var showSheet = false
  
  var body: some View
  {
    NavigationStack
    {
      Group
      {
        if categories.isEmpty
        {
          ContentUnavailableView("Ingen kategorier registrert", systemImage: "square.stack.3d.up.slash")
        }
        else
        {
          List(categories)
          {
            category in
            
            NavigationLink
            {
              CategoryEdit(category: category)
            }
            label:
            {
              CategoryRow(category: category)
            }
          }
        }
      }
      .toolbar
      {
        ToolbarItem(placement: .topBarLeading)
        {
          Button()
          {
            dismiss()
          }
          label:
          {
            Image(systemName: "chevron.backward")
            Text("Tilbake")
          }

        }
        
        ToolbarItem(placement: .topBarTrailing)
        {
          Button
          {
            showSheet.toggle()
          }
          label:
          {
            Image(systemName: "plus.circle.fill").font(.title)
          }
        }
      }
      .sheet(isPresented: $showSheet)
      {
        CategoryAdd()
      }
      .navigationTitle("Kategorier")
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
  }
}

#Preview
{
  CategoryView().modelContainer(for: Flight.self, inMemory: true)
}
