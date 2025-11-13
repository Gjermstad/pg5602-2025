//
//  MapView.swift
//  Atlas
//

import SwiftUI
import MapKit

struct MapView: View
{
  // 1️⃣ Modell som henter alle stedene fra GeoApify
  @EnvironmentObject var placesModel: PlacesModel
  
  // 2️⃣ Brukes til å hente mobilens posisjon og kompass retning
  let locationManager = CLLocationManager()
  
  // 3️⃣ State-variabler for å vise/ikke vise forskjellige ark
  @State private var showSearch = false
  @State private var showDetail = false
  
  // 4️⃣ Kategoriradius og limit som brukes ved søk
  @State var category: Category = .hotel
  @State var radius: Double = 10_000
  @State var limit: Int = 10

  // 5️⃣ Kartets posisjon og sted som bruker har valgt i kartet
  @State var position = MapCameraPosition.farsund
  @State private var selectedPlace: PlacesFeature?
  
  // Flag for å merke når brukeren drar kartet
  @State private var userDragging = false
  
  var body: some View
  {
    // Henter symbol og farge basert på kategori
    let (icon, color) = placesModel.category.symbol
    
    // SwiftData Map-komponent (fra SwiftUI Maps)
    Map(position: $position)
    {
      // Itererer gjennom alle steder og legger ut pins
      ForEach(placesModel.places)
      {
        place in
        
        // Lager koordinater for stedet
        let coordinate = CLLocationCoordinate2D(latitude: place.properties.lat, longitude: place.properties.lon)
        
        // Egendefinert pin med navn og ikon
        Annotation(place.properties.name, coordinate: coordinate)
        {
          VStack
          {
            Image(systemName: icon)
              .foregroundStyle(color)
              .stylePin() // Se Global for stylePin
          }
          .onTapGesture
          {
            // Setter valgt sted når brukeren trykker på pin
            selectedPlace = place
          }
          
          // Viser PinView kun når dette stedet er valgt
          if selectedPlace?.id == place.id
          {
            PinView(selectedPlace: $selectedPlace, showDetail: $showDetail)
          }
        }
      }
      
      // Viser brukerens nåværende posisjon på kartet
      UserAnnotation
      {
        Image(systemName: "dot.scope")
          .foregroundStyle(Color.red)
          .stylePin() // Se Global for stylePin
      }
    }
    .overlay
    {
      if placesModel.isLoading
      {
        LoadingView()
      }
    }
    .onAppear
    {
      // Ber om tillatelse til å hente GPS posisjon
      locationManager.requestWhenInUseAuthorization()
    }
    .mapControls
    {
      // Legger til knapper for brukerposisjon og kompass
      MapUserLocationButton()
      MapCompass()
    }
    .onMapCameraChange
    {
      camera in
      
      // Når brukeren flytter eller zoomer kartet
      userDragging = true
      
      let newPosition = MapCameraPosition.region(camera.region)
      
      // Oppdater modellen kun hvis posisjonen faktisk endres
      if placesModel.position != newPosition
      {
        placesModel.position = newPosition
      }
      
      userDragging = false
    }
    .onReceive(placesModel.$position)
    {
      newPosition in
      
      // Oppdater kartet kun hvis verdien faktisk endres og brukeren ikke drar
      if newPosition != position && !userDragging
      {
        withAnimation
        {
          position = newPosition
        }
      }
    }
    .toolbar
    {
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
    .sheet(isPresented: $showSearch)
    {
      VStack(spacing: 20)
      {
        // Søk etter by eller adresse
        SearchView(position: $position).padding(.top, 25)

        // Kategori og radius
        VStack(alignment: .leading, spacing: 12)
        {
          Picker("Kategori", selection: $category)
          {
            Text("Hotell").tag(Category.hotel)
            Text("Restaurant").tag(Category.restaurant)
            Text("Caffebar").tag(Category.cafe)
          }
          .pickerStyle(.segmented)

          VStack(alignment: .leading, spacing: 6)
          {
            HStack
            {
              Text("Radius")
              Spacer()
              Text("\(Int(radius / 1000)) km").foregroundStyle(.secondary)
            }

            Slider(value: $radius, in: 1000...100_000, step: 500)
            Stepper("Vis inntil \(limit) forslag", value: $limit, in: 1...50)
          }
        }
        .padding(.horizontal)

        // Søkeknapp
        Button
        {
          Task
          {
            await placesModel.fetchPlaces(category: category, radius: radius, limit: limit)
          }
          showSearch = false
        }
        label:
        {
          Label("Søk", systemImage: "magnifyingglass").frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(.blue)
        .padding()

        Spacer()
      }
      .presentationDetents([.fraction(0.6)])
      .scrollContentBackground(.hidden)
    }

    .sheet(isPresented: $showDetail)
    {
      if let placeId = selectedPlace?.properties.placeId
      {
        DetailView(placeId: placeId).presentationDetents([.fraction(0.5)])
      }
      else
      {
        Text("⚠️ Du må velge et sted før du kan se detaljer.").presentationDetents([.fraction(0.2)])
      }
    }
  }
}

#Preview
{
  NavigationStack
  {
    // Forhåndsvisning av MapView med en tom PlacesModel
    MapView().environmentObject(PlacesModel())
  }
}
