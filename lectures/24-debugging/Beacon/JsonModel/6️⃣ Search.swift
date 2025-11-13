//
//  Search.swift
//  Beacon
//

import Foundation
import MapKit

//
// Representerer svaret fra GeoApify/Autoresponse som inneholder
// en liste med steder fra et søk på adresse.
//
struct SearchResponse: Decodable
{
  let results: [SearchResult] // Liste over treff fra API-et
}

//
// Inneholder ett bestemt sted
// Representerer ett enkelt sted i resultatlisten med tilhørende metadata og posisjonsdata.
//
struct SearchResult: Decodable, Identifiable
{
  var id: String
  {
    place_id ?? UUID().uuidString
  }
  
  let country: String?       // Landnavn (f.eks. "Norway")
  let county: String?        // Fylke (f.eks. "Agder")
  let city: String?          // By (f.eks. "Farsund")
  let municipality: String?  // Kommune (ofte samme som city)
  let postcode: String?      // Postnummer (f.eks. "4550")
  let lon: Double?           // Lengdegrad (øst/vest-koordinat)
  let lat: Double?           // Breddegrad (nord/sør-koordinat)
  let place_id: String?      // Unik ID
}
