//
//  GeoFeature.swift
//  Beacon
//
//  Created by Stig Højklint on 26/10/2025.
//

import Foundation

// 2️⃣ Ett bestemt sted
struct GeoFeature: Decodable, Identifiable
{
  var id: String
  {
    properties.placeId ?? UUID().uuidString
  }

  let type: String              // Typisk "Feature"
  let properties: GeoProperties // Metadata om stedet
  let geometry: GeoGeometry     // Koordinater i GeoJSON-format
}
