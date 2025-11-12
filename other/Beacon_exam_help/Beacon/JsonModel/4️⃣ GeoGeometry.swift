//
//  GeoGeometry.swift
//  Beacon
//
//  Created by Stig Orla Sørli Højklint on 28/10/2025.
//

import Foundation

// 4️⃣ Koordinater til stedet
struct GeoGeometry: Decodable
{
  let type: String          // Typiske verdier er Point, LineString eller Polygon
  let coordinates: [Double] // [longitude, latitude]
}
