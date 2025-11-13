//
//  DetailView.swift
//  Beacon
//

import SwiftUI

struct DetailView: View
{
  // Modell-objektet som holder detaljdata og laster dem fra API-et
  @StateObject private var detailModel = DetailModel()
  
  // ID-en til stedet som skal vises (sendes inn fra en annen View)
  let placeId: String
  
  var body: some View
  {
    VStack
    {
      // Viser spinner dersom modellen ikke har fått detaljer eller noenfeilmelding
      if detailModel.isLoading
      {
        LoadingView(false)
      }
      else if let detail = detailModel.detail
      {
        VStack(alignment: .leading, spacing: 16)
        {
          Text(detail.properties.name).font(.title)
          
          if let address = detail.properties.formatted
          {
            Text(address).font(.title2).foregroundStyle(.secondary)
          }
          
          HStack
          {
            if let city = detail.properties.city { Text(city) }
            if let country = detail.properties.country { Text("• \(country)") }
          }
          .font(.title2)
          .foregroundStyle(.secondary)
        }
        .padding()
      }
      else if let message = detailModel.message
      {
        Text(message)
      }
    }
    .task
    {
      await detailModel.fetchDetail(placeId: placeId)
    }
    .padding()
  }
}

#Preview
{
  // Eksempel-ID for Bergen som brukes i forhåndsvisning.
  let id = "51cf8d44c3bd4d1540590491459a78324e40f00103f9011b6b440100000000c00208"
  
   DetailView(placeId: id)
}
