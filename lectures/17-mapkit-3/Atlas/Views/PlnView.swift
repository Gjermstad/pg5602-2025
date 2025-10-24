//
//  PlnView.swift
//  Atlas
//
//  Created by Stig Højklint on 24/10/2025.
//

import SwiftUI

struct PinView: View
{
  var place: Place
  @Binding var showPlace: Bool
  
  var body: some View
  {
    VStack(spacing: 10)
    {
      Text(place.name).font(.headline).bold()
      
      Text("Her er det plass til beskrivelse av stedet og et bilde dersom du ønsker det.")
        .multilineTextAlignment(.center)
        .font(.subheadline)
      
      Button("Mer info")
      {
        withAnimation(.spring()) { showPlace.toggle() }
      }
      .buttonStyle(.glass)
      .tint(.blue)
    }
    .padding()
    .frame(maxWidth: 250)
    .background(.thinMaterial)
    .cornerRadius(16)
    .shadow(radius: 8)
  }
}

#Preview
{
  let place = Place(name: "Bergen", category: .city, lat: 60.39299, lon: 5.32415)
  
  NavigationStack
  {
    PinView(place: place, showPlace: .constant(false))
  }
}
