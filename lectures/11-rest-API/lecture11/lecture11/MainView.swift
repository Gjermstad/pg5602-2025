//
//  ContentView.swift
//  lecture11
//
//  Created by Kenneth Andre Bettum Gjermstad on 08/10/2025.
//

import SwiftUI

struct MainView: View
{
  @State private var quotes: [Quote] = []
  
  // eksempel på en tuple i Swift. Vi kan få tak i data med student.name og student.adress
  // let student = (name: "Stig", adress: "Bergen")
  
  var body: some View
  {
    NavigationStack
    {
      List(Array(quotes.enumerated()), id: \.element)
      { index, quote in
        VStack(alignment: .leading, spacing: 4)
        {
          Text("Quote \(index + 1): \"\(quote.quote)\"")
            .font(.headline)
          Text("- \(quote.author)")
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
      }
        .listStyle(.plain)
        .navigationTitle("Breaking Bad")
        .toolbar
      {
        ToolbarItem(placement: .topBarTrailing)
        {
          Button
          {
            
          }
        label:
          {
            Image(systemName: "icloud.and.arrow.down.fill")
          }
        }
      }
      // Bruker vi en .onAppear til å laste ned fra API vil appen låse seg til alt er lastet ned, noe som ikke er bra om f.eks. nettet er dårlig eller mangler
      .task
      {
        // Det er samme oppsett for alle REST API med guard etterfulgt av do-catch
        
        // guard sjekker om variabelen myUrl får en verdi, hvis ikke kjører koden i else{} for vi har fått en error
        guard let myUrl = URL(string: url) else
        {
          fatalError("Beklager, men finner ikke url adressen: \(url)")
        }
        
        do
        {
          // Vi må ha med try await siden det er en asynkron funksjon. Try await betyr at appen ikke stopper og venter på svar, men går videre
          // URLsession returnerer en tuple (datapakker + metadata) så derfor lager vi en tuple for variablene som skal lagre begge deler
          // Ved å bruke _ så sier vi at vi ikke er interessert i å lagre metadata, eller vi kan gi variablene et navn om vi ønsker å ha tilgang på data
          let (data, _) = try await URLSession.shared.data(from: myUrl)
          
          quotes = try JSONDecoder().decode([Quote].self, from: data)
        }
        catch
        {
          fatalError(error.localizedDescription)
        }
      }
    }
  }
}

#Preview {
  MainView()
}
