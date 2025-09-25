//
//  CategoryLink.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 12/10/2023.
//

import SwiftUI

struct CategoryRow: View 
{
  var category: Category
  
  var body: some View
  {
    HStack(alignment: .center)
    {
      Text(category.name.first!.uppercased())
        .font(.title2).foregroundStyle(.white)
        .frame(width: 60, height: 60)
        .background(Gradient(colors: [Color("category1"), Color("category2")]))
        .clipShape(Circle())
      
      VStack(alignment: .leading)
      {
        Text(category.name).fontWeight(.semibold)
        Text(category.note)
      }
      
      if category.favorite
      {
        Spacer()
        Image(systemName: "star.fill").foregroundColor(.yellow).font(.title2)
      }
    }
    .swipeActions(edge: .leading, allowsFullSwipe: true)
    {
      Button
      {
        category.favorite.toggle()
      }
      label:
      {
        Image(systemName: "star.fill")
      }
      .tint(.yellow)
    }
    .swipeActions(edge: .trailing, allowsFullSwipe: false)
    {
      Button(role: .destructive)
      {
        category.trash = true
      }
      label:
      {
        Image(systemName: "archivebox")
      }
    }
  }
}
