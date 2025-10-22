//
//  ContentView.swift
//  Atlas
//
//  Created by Stig Orla Sørli Højklint on 22/10/2025.
//

import SwiftUI

struct MainView: View
{
  var body: some View
  {
    TabView
    {
      NavigationStack
      {
        MapView()
      }
      .tabItem
      {
        Label("Kart", systemImage: "map")
      }
      
      NavigationStack
      {
        FavoriteView()
      }
      .tabItem
      {
        Label("Favoritter", systemImage: "heart")
      }
    }
  }
}

#Preview
{
  MainView().environmentObject(PlaceStore())
}
