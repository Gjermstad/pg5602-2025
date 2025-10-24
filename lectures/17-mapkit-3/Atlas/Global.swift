//
//  Global.swift
//  Atlas
//
//  Created by Stig Orla Sørli Højklint on 22/10/2025.
//

import SwiftUI
import MapKit

// En ViewModifier er en gjenbrukbar måte å style eller endre en visning på.
// I stedet for å skrive .font(), .padding(), .background() og .clipShape() hver gang,
// kan du samle disse i én modifier og bruke den overalt.

struct pinStyle: ViewModifier
{
  // ViewModifier er en protokoll med en fast signatur:
  // body er den eneste metoden du skal implementere.
  // content representerer den visningen du skal modifisere.
  func body(content: Content) -> some View
  {
    content
      .font(.title)
      .fontWeight(.bold)
      .foregroundStyle(Color.red)
      .padding(7)
      .background(.bar)
      .clipShape(Circle())
      .opacity(0.5)
      .shadow(radius: 5)
  }
}

struct buttonStyle: ViewModifier
{
  func body(content: Content) -> some View
  {
    content
      .font(.title)
      .foregroundStyle(Color.blue)
      .padding(7)
  }
}

// Utvider CLLocationCoordinate2D med egne statiske koordinater
// static let brukes slik at du kan kalle dem direkte uten å opprette et objekt:
extension CLLocationCoordinate2D
{
  static let farsund = CLLocationCoordinate2D(latitude: 58.09661439369582, longitude: 6.70174744220072)
  static let kvernevik = CLLocationCoordinate2D(latitude: 58.97058773462169, longitude: 5.593886466916744)
  static let fjellvegen = CLLocationCoordinate2D(latitude: 60.533225115618805, longitude: 8.481715115941077)
}

//
// ⚠️ Norske byer
//
let norwegianCities: [Place] =
[
  Place(name: "Oslo", category: .city, lat: 59.9139, lon: 10.7522),
  Place(name: "Bergen", category: .city, lat: 60.39299, lon: 5.32415),
  Place(name: "Trondheim", category: .city, lat: 63.4305, lon: 10.3951),
  Place(name: "Stavanger", category: .city, lat: 58.969975, lon: 5.733107),
  Place(name: "Tromsø", category: .city, lat: 69.6496, lon: 18.9560),
  Place(name: "Kristiansand", category: .city, lat: 58.1467, lon: 7.9956),
  Place(name: "Drammen", category: .city, lat: 59.7439, lon: 10.2045),
  Place(name: "Fredrikstad", category: .city, lat: 59.2181, lon: 10.9298),
  Place(name: "Skien", category: .city, lat: 59.2097, lon: 9.6099),
  Place(name: "Ålesund", category: .city, lat: 62.4722, lon: 6.1549),
  Place(name: "Sandnes", category: .city, lat: 58.8524, lon: 5.7352),
  Place(name: "Haugesund", category: .city, lat: 59.4136, lon: 5.2680),
  Place(name: "Bodø", category: .city, lat: 67.2804, lon: 14.4049),
  Place(name: "Hamar", category: .city, lat: 60.7945, lon: 11.0670),
  Place(name: "Lillehammer", category: .city, lat: 61.1153, lon: 10.4662)
]

//
// ⚠️ Avinor flyplasser
//
let avinorAirports: [Place] =
[
  Place(name: "Oslo lufthavn Gardermoen", category: .avinor, lat: 60.1976, lon: 11.1004),
  Place(name: "Bergen lufthavn Flesland", category: .avinor, lat: 60.2934, lon: 5.2181),
  Place(name: "Trondheim lufthavn Værnes", category: .avinor, lat: 63.4578, lon: 10.9240),
  Place(name: "Stavanger lufthavn Sola", category: .avinor, lat: 58.8768, lon: 5.6379),
  Place(name: "Tromsø lufthavn Langnes", category: .avinor, lat: 69.6833, lon: 18.9189),
  Place(name: "Kristiansand lufthavn Kjevik", category: .avinor, lat: 58.2042, lon: 8.0854),
  Place(name: "Ålesund lufthavn Vigra", category: .avinor, lat: 62.5604, lon: 6.1102),
  Place(name: "Bodø lufthavn", category: .avinor, lat: 67.2692, lon: 14.3633),
  Place(name: "Harstad/Narvik lufthavn Evenes", category: .avinor, lat: 68.4913, lon: 16.6781),
  Place(name: "Molde lufthavn Årø", category: .avinor, lat: 62.7447, lon: 7.2625),
  Place(name: "Alta lufthavn", category: .avinor, lat: 69.9761, lon: 23.3717),
  Place(name: "Kirkenes lufthavn Høybuktmoen", category: .avinor, lat: 69.7258, lon: 29.8913),
  Place(name: "Hammerfest lufthavn", category: .avinor, lat: 70.6797, lon: 23.6689),
  Place(name: "Lakselv lufthavn Banak", category: .avinor, lat: 70.0688, lon: 24.9735),
  Place(name: "Mehamn lufthavn", category: .avinor, lat: 71.0297, lon: 27.8267),
  Place(name: "Vadsø lufthavn", category: .avinor, lat: 70.0653, lon: 29.8447),
  Place(name: "Vardø lufthavn Svartnes", category: .avinor, lat: 70.3554, lon: 31.0446),
  Place(name: "Sandnessjøen lufthavn Stokka", category: .avinor, lat: 65.9568, lon: 12.4689),
  Place(name: "Brønnøysund lufthavn Brønnøy", category: .avinor, lat: 65.4611, lon: 12.2175),
  Place(name: "Mo i Rana lufthavn Røssvoll", category: .avinor, lat: 66.3639, lon: 14.3014),
  Place(name: "Mosjøen lufthavn Kjærstad", category: .avinor, lat: 65.7830, lon: 13.2149),
  Place(name: "Namsos lufthavn", category: .avinor, lat: 64.4722, lon: 11.5786),
  Place(name: "Rørvik lufthavn Ryum", category: .avinor, lat: 64.8383, lon: 11.1461),
  Place(name: "Ørsta/Volda lufthavn Hovden", category: .avinor, lat: 62.1800, lon: 6.0747),
  Place(name: "Florø lufthavn", category: .avinor,lat: 61.5836, lon: 5.0246),
  Place(name: "Sogndal lufthavn Haukåsen", category: .avinor, lat: 61.1561, lon: 7.1378),
  Place(name: "Førde lufthamn Bringeland", category: .avinor, lat: 61.3920, lon: 5.7634),
  Place(name: "Sandane lufthamn Anda", category: .avinor, lat: 61.8300, lon: 6.1058),
  Place(name: "Stokmarknes lufthavn Skagen", category: .avinor, lat: 68.5789, lon: 14.9113),
  Place(name: "Leknes lufthavn", category: .avinor, lat: 68.1525, lon: 13.6094),
  Place(name: "Røst lufthavn", category: .avinor, lat: 67.5278, lon: 12.1033),
  Place(name: "Svolvær lufthavn Helle", category: .avinor, lat: 68.2433, lon: 14.6692),
  Place(name: "Andøya lufthavn Andenes", category: .avinor, lat: 69.2925, lon: 16.1442),
  Place(name: "Båtsfjord lufthavn", category: .avinor, lat: 70.6003, lon: 29.6917),
  Place(name: "Hasvik lufthavn", category: .avinor, lat: 70.4867, lon: 22.1397),
  Place(name: "Berlevåg lufthavn", category: .avinor, lat: 70.8650, lon: 29.0342),
  Place(name: "Honningsvåg lufthavn Valan", category: .avinor, lat: 70.9866, lon: 25.8324)
]

//
// ⚠️ Flyplasser som ikke er drevet av Avinor
//
let nonAvinorAirports: [Place] =
[
  Place(name: "Sandefjord lufthavn Torp", category: .nonavinor, lat: 59.1867, lon: 10.2586), // Drevet av Sandefjord lufthavn AS
  Place(name: "Oslo lufthavn Rygge (stengt)", category: .nonavinor, lat: 59.3788, lon: 10.7856), // Tidligere kommersiell, nå militær
  Place(name: "Notodden flyplass", category: .nonavinor, lat: 59.5656, lon: 9.2122), // Kommunal, brukt til skoleflyging
  Place(name: "Geiteryggen flyplass (Skien)", category: .nonavinor, lat: 59.1850, lon: 9.5667), // Kommunal, tidligere kommersiell
  Place(name: "Jarlsberg flyplass (Tønsberg)", category: .nonavinor, lat: 59.2933, lon: 10.3761), // Privat, flyklubb
  Place(name: "Eggemoen Aviation & Technology Park", category: .nonavinor, lat: 60.2183, lon: 10.3511), // Privat, teknologipark
  Place(name: "Stord lufthavn Sørstokken", category: .nonavinor, lat: 59.7919, lon: 5.3408), // Drevet av Stord lufthavn AS
  Place(name: "Fagernes lufthavn Leirin", category: .nonavinor, lat: 60.8756, lon: 9.0606), // Tidligere Avinor, nå kommunal
  Place(name: "Kjeller flyplass", category: .nonavinor, lat: 59.9700, lon: 11.0500), // Militær og flyhistorisk
  Place(name: "Fornebu (nedlagt)", category: .nonavinor, lat: 59.8897, lon: 10.6178), // Historisk, nå byutvikling
  Place(name: "Slemmestad sjøflyhavn", category: .nonavinor, lat: 59.7833, lon: 10.5000), // Vannflyplass
  Place(name: "Elverum flyplass Starmoen", category: .nonavinor, lat: 60.8800, lon: 11.6200), // Flyklubb og skoleflyging
  Place(name: "Rakkestad flyplass", category: .nonavinor, lat: 59.4600, lon: 11.3400), // Privat, flyklubb
  Place(name: "Hamar flyplass (Stafsberg)", category: .nonavinor, lat: 60.8183, lon: 11.0675), // Kommunal, GA
  Place(name: "Bømoen flyplass (Voss)", category: .nonavinor, lat: 60.6333, lon: 6.4833), // Fallskjerm og GA
  Place(name: "Oppdal flyplass", category: .nonavinor, lat: 62.5833, lon: 9.7000), // GA og fjellflyging
  Place(name: "Reinsvoll flyplass", category: .nonavinor, lat: 60.6667, lon: 10.6333), // Flyklubb
  Place(name: "Sola sjøflyhavn", category: .nonavinor, lat: 58.8750, lon: 5.6350), // Vannflyplass
  Place(name: "Værøy heliport", category: .nonavinor, lat: 67.6667, lon: 12.6833) // Helikopterrute, ikke Avinor
]
