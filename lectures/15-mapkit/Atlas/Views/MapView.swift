//
//  MapView.swift
//  Atlas
//
//  Created by Kenneth Andre Bettum Gjermstad on 22/10/2025.
//

import SwiftUI
import MapKit

struct MapView: View
{
  @State private var position: MapCameraPosition = .automatic
  var body: some View
  {
    Map()
  }
}

#Preview {
  MapView()
}
