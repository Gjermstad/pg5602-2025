//
//  MapView.swift
//  Atlas
//
//  Created by Stig Orla Sørli Højklint on 22/10/2025.
//

import SwiftUI
import MapKit

struct MapView: View
{
  @EnvironmentObject private var placeStore: PlaceStore
  
  // Oppretter en instans av CLLocationManager
  // CLLocationManager brukes for å få tilgang til enhetens
  // posisjon (GPS) og for å håndtere andre tjenester som heading.
  let locationManager = CLLocationManager()
  
  @State private var showConfig = false
  @State private var showSearch = false
  @State private var showPlace = false
  
  let span: MKCoordinateSpan      // Definerer hvor "zoomet inn" kartet skal være.
  let region: MKCoordinateRegion  // Lager en region som kombinerer midtpunkt og zoomnivå
  @State private var position: MapCameraPosition
  
  @State private var selectedPlace: Place?
  
  init()
  {
    // latitudeDelta og longitudeDelta bestemmer hvor mye av kartet som vises.
    span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    
    // Lager en region som kombinerer midtpunkt og zoomnivå
    region = MKCoordinateRegion(center: .farsund, span: span)
    
    // Initialiserer State-variabelen med en MapCameraPosition basert på regionen
    // Dette gjør at kartet starter med denne posisjonen når viewet vises.
    _position = State(initialValue: MapCameraPosition.region(region))
  }
  
  var body: some View
  {
    Map(position: $position)
    {
      ForEach(placeStore.places)
      {
        place in
        
        // Opprett koordinater for stedet
        let coordinate = CLLocationCoordinate2D(latitude: place.lat, longitude: place.lon)
        
        // Hent ikon og farge ut fra kategori
        let (icon, color) = place.category.symbol
        
        // Egendefinert pin for hvert sted
        Annotation(place.name, coordinate: coordinate)
        {
          VStack
          {
            Image(systemName: icon).foregroundColor(color).onTapGesture
            {
              selectedPlace = place
            }
            
            // Snakkeboble vises kun hvis denne pin er valgt
            if selectedPlace?.id == place.id
            {
              PinView(place: place, showPlace: $showPlace)
            }
          }
        }
      }
      
      // Denne viser brukerens nåværende posisjon
      UserAnnotation
      {
        Image(systemName: "dot.scope").modifier(pinStyle())
      }
    }
    .onAppear
    {
      // Ber brukeren om tillatelse til å bruke posisjon
      locationManager.requestWhenInUseAuthorization()
    }
    .mapControls
    {
      // Legger til innebygde kartkontroller
      MapUserLocationButton()
      MapCompass()
    }
    .toolbar
    {
      ToolbarItem(placement: .topBarLeading)
      {
        Button
        {
          showConfig.toggle()
        }
        label:
        {
          Image(systemName: "line.3.horizontal")
        }
      }
      
      ToolbarItem(placement: .topBarTrailing)
      {
        Button
        {
          showSearch.toggle()
        }
        label:
        {
          Image(systemName: "magnifyingglass")
        }
      }
    }
    .sheet(isPresented: $showConfig)
    {
      VStack
      {
        Button("Norske byer")
        {
          placeStore.addCities()
          showConfig = false
          
          if let region = placeStore.zoomToFit()
          {
            withAnimation(.easeInOut(duration: 1.0))
            {
              position = MapCameraPosition.region(region)
            }
          }
        }
        
        Button("Avinor flyplasser")
        {
          placeStore.addAvinor()
          showConfig = false
          
          if let region = placeStore.zoomToFit()
          {
            withAnimation(.easeInOut(duration: 1.0))
            {
              position = MapCameraPosition.region(region)
            }
          }
        }
        
        Button("GA flyplasser")
        {
          placeStore.addNonAvinor()
          showConfig = false
          
          if let region = placeStore.zoomToFit()
          {
            withAnimation(.easeInOut(duration: 1.0))
            {
              position = MapCameraPosition.region(region)
            }
          }
        }
        
        Button("Fjern alle plasser")
        {
          placeStore.removePlaces()
          
          withAnimation(.easeInOut(duration: 1.0))
          {
            position = MapCameraPosition.region(region)
          }
        }
      }
      .buttonStyle(.glassProminent)
      .presentationDetents([.fraction(0.25)])
    }
    .sheet(isPresented: $showSearch)
    {
      VStack
      {
      }
      .presentationDetents([.fraction(0.3)])
    }
    .sheet(isPresented: $showPlace)
    {
      VStack(spacing: 20)
      {
        Button("Lukk")
        {
          selectedPlace = nil
          showPlace = false
        }
      }
      .presentationDetents([.fraction(0.3)])
    }
  }
}

#Preview
{
  NavigationStack
  {
    MapView().environmentObject(PlaceStore())
  }
}
