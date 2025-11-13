//
//  MainView.swift
//  Beacon
//

import SwiftUI

struct MainView: View
{
  var body: some View
  {
    // TabView brukes til å lage et grensesnitt med flere faner
    TabView
    {
      NavigationStack
      {
        MapView()
      }
      .tabItem
      {
        Label("Kart", systemImage: "globe")
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
  MainView().environmentObject(PlacesModel())
}
