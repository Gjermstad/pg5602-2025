//
//  Detail.swift
//  Beacon
//

//
// Representerer svaret fra GeiApify/Place API som henter informasjon fra ett spesifikt sted.
// Strukturen ligner på PlacesResponse, men inneholder mer nøyaktige adresse- og posisjonsdata.
//
struct DetailResponse: Decodable
{
  let type: String              // Typisk "FeatureCollection"
  let features: [DetailFeature] // Liste med ett eller flere detaljerte stedobjekter
}

//
// Ett detaljert sted (Feature)
// Representerer et konkret sted med detaljerte adresse- og posisjonsdata.
//
struct DetailFeature: Decodable
{
  let type: String               // Typisk "Feature"
  let properties: DetailProperty // Metadata og adresseinformasjon
  let geometry: DetailGeometry   // Koordinater for plassering på kart
}

//
// Inneholder detaljerte data om stedet, som navn, gate, postnummer, landkode
// og fullt formatert adresse som kan vises direkte i appen.
//
struct DetailProperty: Decodable
{
  let placeId: String       // Unik ID for stedet (Geoapify "place_id")
  let featureType: String?  // Type funksjon, f.eks. "building" eller "poi"
  let name: String          // Stedets navn, f.eks. "Oslo Rådhus"
  let housenumber: String?  // Husnummer, f.eks. "3"
  let street: String?       // Gatenavn, f.eks. "Rådhusgata"
  let city: String?         // By, f.eks. "Oslo"
  let county: String?       // Fylke eller region, f.eks. "Oslo"
  let postcode: String?     // Postnummer, f.eks. "0151"
  let country: String?      // Land, f.eks. "Norway"
  let countryCode: String?  // Landkode, f.eks. "NO"
  let formatted: String?    // Fullt formatert adresse (klar til visning)
  let addressLine1: String? // Identisk med feltet "name"
  let addressLine2: String? // Adresse til stedet
  let lat, lon: Double      // Geografiske koordinater (latitude, longitude)

  enum CodingKeys: String, CodingKey
  {
    case featureType = "feature_type"
    case name
    case housenumber
    case street
    case city
    case county
    case postcode
    case country
    case countryCode = "country_code"
    case formatted
    case addressLine1 = "address_line1"
    case addressLine2 = "address_line2"
    case lat, lon
    case placeId = "place_id"
  }
}

//
// Angir hvilken type geometri som brukes (som regel "Point")
// samt en liste med koordinater [longitude, latitude].
//
struct DetailGeometry: Decodable
{
  let type: String          // Vanligvis "Point"
  let coordinates: [Double] // [longitude, latitude]
}
