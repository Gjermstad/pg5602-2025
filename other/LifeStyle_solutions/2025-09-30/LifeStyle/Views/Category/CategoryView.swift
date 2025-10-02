//
//  CategoryView.swift
//  LifeStyle
//
//  Created by Stig Orla Sørli Højklint on 26/09/2025.
//

import SwiftData
import SwiftUI

struct CategoryView: View
{
  @Query(sort: \CategoryModel.title, order: .forward) private var categories: [CategoryModel]
  
  var body: some View
  {
    // Henter kategorier som IKKE er arkivert i søppelbøtta
    let filteredCategories = categories.filter{ !$0.trashbin }
    
    NavigationStack
    {
      Group
      {
        if filteredCategories.isEmpty
        {
          EmptyView(title: "Ingen kategorier", notes: "Vennligst legg til én eller flere kategorier.")
        }
        else
        {
          List
          {
            MessageView(text: "Sveip mot høyre for å favorisere en kategori, og mot venstre for å sende den til søppelbøtta.")
              .listRowSeparator(.hidden)
            
            ForEach(filteredCategories)
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
              .listRowSeparator(.hidden)
            }
          }
          .listStyle(.plain)
        }
      }
      .navigationTitle("Kategorier")
      .toolbar
      {
        ToolbarItem(placement: .topBarTrailing)
        {
          NavigationLink
          {
            CategoryAdd()
          }
          label:
          {
            Image(systemName: "plus.circle.fill").font(.title)
          }
        }
      }
    }
  }
}

#Preview
{
  CategoryView()
}
