//
//  SearchView.swift
//  Beacon
//
//  Created by Stig Højklint on 06/11/2025.
//

import SwiftUI
import MapKit

struct SearchView: View
{
  @StateObject var searchModel = SearchModel()

  @State private var selectedPlaceId: String?
  @Binding var position: MapCameraPosition
  @State var searchText = ""

  var body: some View
  {
    VStack(spacing: 8)
    {
      TextField("Søk på by eller adresse...", text: $searchText)
        .padding(10)
        .background(Color(.systemGray5))
        .cornerRadius(15)
        .onChange(of: searchText)
      {
        Task
        {
          if !searchText.isEmpty
          {
            await searchModel.fetchSearch(text: searchText, limit: 3)
          }
          else
          {
            searchModel.places = []
          }
        }
      }

      if !searchModel.places.isEmpty
      {
        VStack(spacing: 5)
        {
          ForEach(searchModel.places, id: \.id)
          {
            place in
            let row = [place.city, place.county, place.country]
            let text = row.compactMap { $0 }.joined(separator: ", ")

            Button
            {
              position = cameraPosition(lat: place.lat, lon: place.lon)!
            }
            label:
            {
              HStack
              {
                Image(systemName: "mappin.and.ellipse").foregroundColor(.accentColor)
                Text(text.isEmpty ? "Ukjent sted" : text).foregroundColor(.primary)
                Spacer()
              }
              .padding(10)
              .background(Color(.systemGray6))
              .cornerRadius(15)
            }
        //    .buttonStyle(.plain)
          }
        }
      }
    }
    .padding()
  }
}

#Preview
{
  let position = MapCameraPosition.farsund

  SearchView(position: .constant(position))
}
