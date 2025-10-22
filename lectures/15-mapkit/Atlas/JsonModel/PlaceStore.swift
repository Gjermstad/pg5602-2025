//
//  Places.swift
//  Atlas
//
//  Created by Stig Orla Sørli Højklint on 21/10/2025.
//

import SwiftUI

// Combine er Apples rammeverk for reaktiv programmering,
// altså for å observere og reagere på data som endrer seg over tid
// @Published, ObservableObject, Publisher, Subscriber, osv.
import Combine

//
// ⚠️ Strukturen for et enkelt sted
//
struct Place: Identifiable
{
  let id = UUID()
  let name: String
  let lat: Double
  let lon: Double
}

//
// Klasse som inneholder array/tabell
//

final class PlaceStore: ObservableObject
{
  @Published var places: [Place]
  
  init()
  {
    places = []
  }
  
  func addCities()
  {
    places.removeAll()
    // contentsOf brukes når du skal legge til et helt array med data og ikke bare et enkelt objekt/datapunkt
    places.append(contentsOf: norwegianCities)
  }
  
  func addAvinor()
  {
    places.removeAll()
    places.append(contentsOf: avinorAirports)
  }
  
  func addNonAvinor()
  {
    places.removeAll()
    places.append(contentsOf: nonAvinorAirports)
  }
}

//
// ⚠️ Norske byer
//
let norwegianCities: [Place] =
[
    Place(name: "Oslo", lat: 59.9139, lon: 10.7522),
    Place(name: "Bergen", lat: 60.39299, lon: 5.32415),
    Place(name: "Trondheim", lat: 63.4305, lon: 10.3951),
    Place(name: "Stavanger", lat: 58.969975, lon: 5.733107),
    Place(name: "Tromsø", lat: 69.6496, lon: 18.9560),
    Place(name: "Kristiansand", lat: 58.1467, lon: 7.9956),
    Place(name: "Drammen", lat: 59.7439, lon: 10.2045),
    Place(name: "Fredrikstad", lat: 59.2181, lon: 10.9298),
    Place(name: "Skien", lat: 59.2097, lon: 9.6099),
    Place(name: "Ålesund", lat: 62.4722, lon: 6.1549),
    Place(name: "Sandnes", lat: 58.8524, lon: 5.7352),
    Place(name: "Haugesund", lat: 59.4136, lon: 5.2680),
    Place(name: "Bodø", lat: 67.2804, lon: 14.4049),
    Place(name: "Hamar", lat: 60.7945, lon: 11.0670),
    Place(name: "Lillehammer", lat: 61.1153, lon: 10.4662)
]

//
// ⚠️ Avinor flyplasser
//
let avinorAirports: [Place] =
[
    Place(name: "Oslo lufthavn Gardermoen", lat: 60.1976, lon: 11.1004),
    Place(name: "Bergen lufthavn Flesland", lat: 60.2934, lon: 5.2181),
    Place(name: "Trondheim lufthavn Værnes", lat: 63.4578, lon: 10.9240),
    Place(name: "Stavanger lufthavn Sola", lat: 58.8768, lon: 5.6379),
    Place(name: "Tromsø lufthavn Langnes", lat: 69.6833, lon: 18.9189),
    Place(name: "Kristiansand lufthavn Kjevik", lat: 58.2042, lon: 8.0854),
    Place(name: "Ålesund lufthavn Vigra", lat: 62.5604, lon: 6.1102),
    Place(name: "Bodø lufthavn", lat: 67.2692, lon: 14.3633),
    Place(name: "Harstad/Narvik lufthavn Evenes", lat: 68.4913, lon: 16.6781),
    Place(name: "Molde lufthavn Årø", lat: 62.7447, lon: 7.2625),
    Place(name: "Alta lufthavn", lat: 69.9761, lon: 23.3717),
    Place(name: "Kirkenes lufthavn Høybuktmoen", lat: 69.7258, lon: 29.8913),
    Place(name: "Hammerfest lufthavn", lat: 70.6797, lon: 23.6689),
    Place(name: "Lakselv lufthavn Banak", lat: 70.0688, lon: 24.9735),
    Place(name: "Mehamn lufthavn", lat: 71.0297, lon: 27.8267),
    Place(name: "Vadsø lufthavn", lat: 70.0653, lon: 29.8447),
    Place(name: "Vardø lufthavn Svartnes", lat: 70.3554, lon: 31.0446),
    Place(name: "Sandnessjøen lufthavn Stokka", lat: 65.9568, lon: 12.4689),
    Place(name: "Brønnøysund lufthavn Brønnøy", lat: 65.4611, lon: 12.2175),
    Place(name: "Mo i Rana lufthavn Røssvoll", lat: 66.3639, lon: 14.3014),
    Place(name: "Mosjøen lufthavn Kjærstad", lat: 65.7830, lon: 13.2149),
    Place(name: "Namsos lufthavn", lat: 64.4722, lon: 11.5786),
    Place(name: "Rørvik lufthavn Ryum", lat: 64.8383, lon: 11.1461),
    Place(name: "Ørsta/Volda lufthavn Hovden", lat: 62.1800, lon: 6.0747),
    Place(name: "Florø lufthavn", lat: 61.5836, lon: 5.0246),
    Place(name: "Sogndal lufthavn Haukåsen", lat: 61.1561, lon: 7.1378),
    Place(name: "Førde lufthamn Bringeland", lat: 61.3920, lon: 5.7634),
    Place(name: "Sandane lufthamn Anda", lat: 61.8300, lon: 6.1058),
    Place(name: "Stokmarknes lufthavn Skagen", lat: 68.5789, lon: 14.9113),
    Place(name: "Leknes lufthavn", lat: 68.1525, lon: 13.6094),
    Place(name: "Røst lufthavn", lat: 67.5278, lon: 12.1033),
    Place(name: "Svolvær lufthavn Helle", lat: 68.2433, lon: 14.6692),
    Place(name: "Andøya lufthavn Andenes", lat: 69.2925, lon: 16.1442),
    Place(name: "Båtsfjord lufthavn", lat: 70.6003, lon: 29.6917),
    Place(name: "Hasvik lufthavn", lat: 70.4867, lon: 22.1397),
    Place(name: "Berlevåg lufthavn", lat: 70.8650, lon: 29.0342),
    Place(name: "Honningsvåg lufthavn Valan", lat: 70.9866, lon: 25.8324)
]

//
// ⚠️ Flyplasser som ikke er drevet av Avinor
//
let nonAvinorAirports: [Place] =
[
    Place(name: "Sandefjord lufthavn Torp", lat: 59.1867, lon: 10.2586), // Drevet av Sandefjord lufthavn AS
    Place(name: "Oslo lufthavn Rygge (stengt)", lat: 59.3788, lon: 10.7856), // Tidligere kommersiell, nå militær
    Place(name: "Notodden flyplass", lat: 59.5656, lon: 9.2122), // Kommunal, brukt til skoleflyging
    Place(name: "Geiteryggen flyplass (Skien)", lat: 59.1850, lon: 9.5667), // Kommunal, tidligere kommersiell
    Place(name: "Jarlsberg flyplass (Tønsberg)", lat: 59.2933, lon: 10.3761), // Privat, flyklubb
    Place(name: "Eggemoen Aviation & Technology Park", lat: 60.2183, lon: 10.3511), // Privat, teknologipark
    Place(name: "Stord lufthavn Sørstokken", lat: 59.7919, lon: 5.3408), // Drevet av Stord lufthavn AS
    Place(name: "Fagernes lufthavn Leirin", lat: 60.8756, lon: 9.0606), // Tidligere Avinor, nå kommunal
    Place(name: "Kjeller flyplass", lat: 59.9700, lon: 11.0500), // Militær og flyhistorisk
    Place(name: "Fornebu (nedlagt)", lat: 59.8897, lon: 10.6178), // Historisk, nå byutvikling
    Place(name: "Slemmestad sjøflyhavn", lat: 59.7833, lon: 10.5000), // Vannflyplass
    Place(name: "Elverum flyplass Starmoen", lat: 60.8800, lon: 11.6200), // Flyklubb og skoleflyging
    Place(name: "Rakkestad flyplass", lat: 59.4600, lon: 11.3400), // Privat, flyklubb
    Place(name: "Hamar flyplass (Stafsberg)", lat: 60.8183, lon: 11.0675), // Kommunal, GA
    Place(name: "Bømoen flyplass (Voss)", lat: 60.6333, lon: 6.4833), // Fallskjerm og GA
    Place(name: "Oppdal flyplass", lat: 62.5833, lon: 9.7000), // GA og fjellflyging
    Place(name: "Reinsvoll flyplass", lat: 60.6667, lon: 10.6333), // Flyklubb
    Place(name: "Sola sjøflyhavn", lat: 58.8750, lon: 5.6350), // Vannflyplass
    Place(name: "Værøy heliport", lat: 67.6667, lon: 12.6833) // Helikopterrute, ikke Avinor
]
