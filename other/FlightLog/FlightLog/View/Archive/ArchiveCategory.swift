//
//  ArchiveCategory.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 25/10/2023.
//

import SwiftData
import SwiftUI

struct ArchiveCategory: View
{
  @Environment(\.modelContext) private var context
  
  @Query(filter: #Predicate<Category>{$0.trash == true},
         sort: \Category.update, order: .reverse, animation: .default) private var categories: [Category]
  
  var body: some View
  {
    if categories.isEmpty
    {
      Label("Ingen arkiverte kategorier", systemImage: "rectangle.3.group.bubble")
    }
    else
    {
      ForEach(categories)
      {
        category in
        
        VStack(alignment: .leading)
        {
          Text(category.name).fontWeight(.bold)
          Text("Arkivert: \(category.update.formatted(date: .abbreviated, time: .standard))")
          
          if (category.flights?.count ?? 0) > 0
          {
            Divider()
            Text("Kategorien er registrert i \(category.flights!.count) flyturer og kan derfor ikke slettes. ⚠️")
          }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
          Button(role: .destructive)
          {
            context.delete(category)
          }
        label:
          {
            Image(systemName: "trash.fill")
          }
          .disabled((category.flights?.count ?? 0) > 0)
          
          Button(role: .cancel)
          {
            category.update = Date.now
            category.trash = false
          }
        label:
          {
            Image(systemName: "tray.and.arrow.up.fill")
          }
        }
      }
    }
  }
}

#Preview
{
  ArchiveCategory()
}
