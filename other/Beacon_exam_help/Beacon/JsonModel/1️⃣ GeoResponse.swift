//
//  GeoResponse.swift
//  Beacon
//
//  Created by Stig Højklint on 26/10/2025.
//

import Foundation

// 1️⃣ Geoapify hovedrespons (autocomplete eller place details)
struct GeoResponse: Decodable
{
  let type: String           // Typisk "FeatureCollection" eller i sjeldne tilfeller "GeometryCollection" eller "Feature"
  let features: [GeoFeature] // Inneholder alle steder som vi har søkt etter
 }
