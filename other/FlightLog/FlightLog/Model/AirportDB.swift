//
//  AirportDB.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 31/10/2023.
//

import Foundation

let token = "8c2c7b20ec0ffda39c3931d19086d7c32c32494e7b204719acaa9313f61c3c78fc083c56bc97653731ba8584a55c0db6"

struct AirportDB: Decodable
{
  let ident: String
  let type: String
  let name: String
  let iata_code: String
  let latitude_deg: Double
  let longitude_deg: Double
  let elevation_ft: String
  let municipality: String
  let home_link: String
  let country: Country
  
  init(country: Country)
  {
    ident = "Ukjent"
    type = "Ukjent"
    name = "Ukjent"
    iata_code = "Ukjent"
    latitude_deg = 0.0
    longitude_deg = 0.0
    elevation_ft = ""
    municipality = "Ukjent"
    home_link = "Ukjent"
    self.country = country
  }
}
  
struct Country: Decodable
{
  let name: String
  let continent: String
  
  init()
  {
    name = "Ukjent"
    continent = "Ukjent"
  }
}

// Oppretter en DUMMY flyplass
let country = Country()
let airport = AirportDB(country: country)

//
// Asynkron funksjon som henter informasjon om en bestemt flyplass
//
func getAirport(icao: String) async -> AirportDB
{
  // Prøver å opprette kontakt med API server
  guard let connection = URL(string: "https://airportdb.io/api/v1/airport/\(icao)?apiToken=\(token)") else
  {
    // Returnerer DUMMY flyplass på grunn av feil
    return airport
  }
  
  do
  {
    // Prøver å laste ned data fra serveren og ignorerer metadata ved hjelp av UNDERSCORE
    let (data, _) = try await URLSession.shared.data(from: connection)
    
    // Prøver å dekode data i samsvar med tabell strukturen til AirportDB
    return try JSONDecoder().decode(AirportDB.self, from: data)
  }
  catch
  {
    // Returnerer DUMMY flyplass på grunn av feil under nedlasting eller dekoding av data
    return airport
  }
}

//
// Konverterer tall til grader, minutter og sekunder
//
func latitudeDMS(latitude: Double) -> String
{
  var seconds = latitude * 3600
  let degrees = seconds / 3600
  
  seconds = seconds.truncatingRemainder(dividingBy: 3600)
  let minutes = seconds / 60
  
  seconds = seconds.truncatingRemainder(dividingBy: 60)
  let direction = (degrees >= 0 ? "N" : "S")
  
  return String(format: "%.0f° %.0f' %.1f\" %@", abs(degrees), abs(minutes), abs(seconds), direction)
}

//
// Konverterer tall til grader, minutter og sekunder
//
func longitudeDMS(longitude: Double) -> String
{
  var seconds = longitude * 3600
  let degrees = seconds / 3600
  
  seconds = seconds.truncatingRemainder(dividingBy: 3600)
  let minutes = seconds / 60
  
  seconds = seconds.truncatingRemainder(dividingBy: 60)
  let direction = (degrees >= 0 ? "E" : "W")
  
  return String(format: "%.0f° %.0f' %.1f\" %@", abs(degrees), abs(minutes), abs(seconds), direction)
}
