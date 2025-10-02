//
//  CategoryTrash.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 28/09/2025.
//

import SwiftData
import SwiftUI

struct CategoryTrash: View
{
  @Query(sort: \CategoryModel.title, order: .forward) private var categories: [CategoryModel]
  @Environment(\.modelContext) private var context
  
  var body: some View
  {
    let filtered = categories.filter{$0.trashbin}
    
    NavigationStack
    {
      Group
      {
        // Viser en tomvisning dersom ingen kategorier er arkivert.
        if filtered.isEmpty
        {
          EmptyView(title: "Ingen arkiverte kategorier", notes: "Du har ikke sendt noen til søppelbøtta.")
        }
        else
        {
          List
          {
            MessageView(text: "Sveip mot venstre for å velge om du vil gjenopprette kategorien eller slette den permanent.")
              .listRowSeparator(.hidden)
            
            ForEach(filtered)
            {
              category in
              
              HStack
              {
                // AvatarView viser første bokstav i tittelen.
                AvatarView(title: category.title)
                
                VStack(alignment: .leading)
                {
                  // Viser tittelen på kategorien.
                  // Hvis tittelen er for lang, forkortes den med "…"
                  Text(category.title.count > maxTitle ? "\(category.title.prefix(maxTitle)) …" : category.title).font(.title2)
                  
                  // Viser notatene på samme måte med begrenset lengde.
                  Text(category.notes.count > maxNotes ? "\(category.notes.prefix(maxNotes)) …" : category.notes)
                }
                
                Spacer()
                
                // Viser en gul stjerne dersom kategorien er markert som favoritt.
                if (category.favorite)
                {
                  Image(systemName: "star.fill").font(.title).foregroundColor(.yellow)
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
                
                Button(role: .cancel)
                {
                  category.trashbin = false
                  category.update = .now
                }
              label:
                {
                  Image(systemName: "tray.and.arrow.up.fill")
                }
              }
            }
            .listRowSeparator(.hidden)
          }
          .listStyle(.plain)
        }
      }
      .navigationTitle("Arkiverte kategorier")
    }
  }
}

#Preview
{
  CategoryTrash()
}
