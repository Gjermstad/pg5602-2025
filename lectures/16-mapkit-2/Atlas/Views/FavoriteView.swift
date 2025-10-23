//
//  FavoriteView.swift
//  Atlas
//
//  Created by Stig Orla Sørli Højklint on 22/10/2025.
//

import SwiftUI

struct FavoriteView: View
{
  @EnvironmentObject private var places: PlaceStore
  
  var body: some View
  {
    List(places.places)
    {
      place in Text(place.name)
    }
    .navigationTitle("Favoritter")
    .listStyle(.plain)
  }
}

#Preview
{
  NavigationStack
  {
    FavoriteView().environmentObject(PlaceStore())
  }
}
