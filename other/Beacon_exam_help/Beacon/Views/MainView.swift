//
//  MainView.swift
//  Beacon
//
//  Created by Stig Højklint on 24/10/2025.
//

import SwiftUI
import CoreLocation

struct MainView: View
{
  @EnvironmentObject private var data: GeoDataStore

  // Utgangspunkt fort søk
  let farsund = CLLocationCoordinate2D(latitude: 58.09661439369582, longitude: 6.70174744220072)
  
  var body: some View
  {
    Text(data.errorMessage ?? "Ingen kjent feil")
    
    List(data.places)
    {
      place in

      VStack(alignment: .leading)
      {
        Text(place.properties.name ?? "Ukjent navn").font(Font.headline)
        Text(place.properties.city ?? "Ukjent by")
        Text(place.properties.county ?? "Ukjent bydel")
        Text(place.properties.municipality ?? "Ukjent kommune")
        Text(place.properties.formatted ?? "Ukjente detaljer")
      }
    }
    
    Button("Last ned appen her")
    {
      Task
      {
        await data.updateCriteria(category: .cafe, radius: 10_000 ,center: farsund)
      }
    }
  }
}

#Preview
{
  MainView().environmentObject(GeoDataStore())
}
