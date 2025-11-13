//
//  Places.swift
//  Beacon
//

import Foundation

//
// Representerer svaret fra Geoapify/Places API når flere steder hentes.
// Inneholder en samling av steder med grunnleggende informasjon.
//
struct PlacesResponse: Decodable
{
  let type: String               // Typisk "FeatureCollection"
  let features: [PlacesFeature]? // Liste over alle funnede steder
}

//
// Ett bestemt sted (Feature)
// Representerer ett enkelt sted i resultatlisten med tilhørende metadata og posisjonsdata.
//
struct PlacesFeature: Decodable, Identifiable
{
  var id: String
  {
    properties.placeId ?? UUID().uuidString
  }

  let type: String                 // Typisk "Feature"
  let properties: PlacesProperties // Metadata og beskrivelse av stedet
  let geometry: PlacesGeometry     // Geografiske koordinater
}

//
// Inneholder beskrivende data som navn, adresse, administrativ tilhørighet
// og kategorier som definerer hvilken type sted det er.
//
struct PlacesProperties: Decodable
{
  let placeId: String?      // Unik ID for stedet (Geoapify "place_id")
  let name: String          // Stedets navn, f.eks. "Lista Vandrerhjem"
  let country: String?      // Land, f.eks. "Norway"
  let county: String?       // Fylke eller region, f.eks. "Agder"
  let city: String?         // By, f.eks. "Oslo"
  let municipality: String? // Kommune eller administrativ enhet
  let district: String?     // Bydel eller mindre område
  let formatted: String?    // Fullt formatert adresse (klar til visning)
  let lon, lat: Double      // Koordinater (longitude, latitude)
  let categories: [String]? // Liste over stedets kategorier

  enum CodingKeys: String, CodingKey
  {
    case name
    case country
    case county
    case city
    case municipality
    case district
    case formatted
    case lon, lat
    case categories
    case placeId = "place_id"
  }
}

//
// Angir hvilken type form som beskriver stedet (vanligvis "Point")
// samt en liste med koordinater [longitude, latitude].
//
struct PlacesGeometry: Decodable
{
  let type: String          // Typisk "Point", men kan også være "LineString" eller "Polygon"
  let coordinates: [Double] // [longitude, latitude]
}
