//
//  CategoryRow.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 26/09/2025.
//

import SwiftUI

struct CategoryRow: View
{
  var category: CategoryModel
  
  var body: some View
  {
    HStack
    {
      AvatarView(title: category.title)
      
      VStack(alignment: .leading)
      {
        Text(category.title.count > maxTitle ? "\(category.title.prefix(maxTitle)) …" : category.title).font(.title2)
        Text(category.notes.count > maxNotes ? "\(category.notes.prefix(maxNotes)) …" : category.notes)
      }
      
      Spacer()
      
      if (category.favorite)
      {
        Image(systemName: "star.fill").font(.title).foregroundColor(.yellow)
      }
    }
    .swipeActions(edge: .leading, allowsFullSwipe: true)
    {
      Button
      {
        category.favorite.toggle()
        category.update = .now
      }
      label:
      {
        Image(systemName: "star.fill").tint(.yellow)
      }
    }
    .swipeActions(edge: .trailing, allowsFullSwipe: false)
    {
      Button
      {
        category.trashbin = true
        category.update = .now
      }
      label:
      {
        Image(systemName: "trash").tint(.red)
      }
    }
  }
}

#Preview
{
  CategoryRow(category: category).padding(20)
}
