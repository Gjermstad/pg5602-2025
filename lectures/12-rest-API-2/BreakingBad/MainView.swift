//
//
//  ContentView.swift
//  BreakingBad
//
//  Created by Stig Orla Sørli Højklint on 08/10/2025.
//

import SwiftUI

struct MainView: View
{
  @AppStorage("Quotes") private var numberOfQuotes = Int()
  @State private var quotes = [Quote]()
  
  var body: some View
  {
    NavigationStack
    {
      List
      {
        Group
        {
          HStack
          {
            if quotes.isEmpty
            {
              Text("⚠️ Trykk på knappen under for å laste ned \(numberOfQuotes) sitater fra API serveren.")
            }
            else
            {
              Text("👏 Du har faktisk lastet ned \(quotes.count) sitater fra API serveren.")
            }
            
            Spacer()
          }
          
          HStack
          {
            Button("Last ned \(numberOfQuotes) sitater")
            {
              Task
              {
                quotes = await getQuotes(number: numberOfQuotes)
              }
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            Stepper(value: $numberOfQuotes, in: 1...50) {}
          }
        }
        .padding()
        .listSectionSeparator(.hidden)
        .background(adminGradient)
        .cornerRadius(15)
        
        ForEach(quotes)
        {
          row in
          
          HStack
          {
            VStack(alignment: .leading)
            {
              Text(row.quote).font(.headline)
              Text(row.author).font(.subheadline)
            }
            .padding()
            
            Spacer()
          }
        }
        .listRowSeparator(.hidden)
        .background(quoteGradient.opacity(0.5))
        .cornerRadius(15)
      }
      .listStyle(.plain)
      .navigationBarTitle("Breaking Bad")
      .toolbar
      {
        ToolbarItem(placement: .topBarTrailing)
        {
          Button
          {
            quotes.removeAll()
          }
          label:
          {
            Image(systemName: "trash.fill").font(.title2)
          }
        }
      }
    }
  }
}

#Preview
{
  MainView()
}
