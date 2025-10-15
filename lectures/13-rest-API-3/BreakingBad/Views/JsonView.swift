//
//  JsonView.swift
//  BreakingBad
//
//  Created by Stig Orla Sørli Højklint on 14/10/2025.
//

import SwiftUI
import SwiftData

struct JsonView: View
{
  @AppStorage("Quotes") private var numberOfQuotes = Int()
  @Environment(\.modelContext) private var context
  @State private var quotes: [Quote] = []
  
  var body: some View
  {
    NavigationStack
    {
      List
      {
        HStack
        {
          Text("Last ned \(numberOfQuotes) sitater")
          Stepper(value: $numberOfQuotes, in: 1...50) {}
          
          Spacer()
          
          Button
          {
            Task
            {
              quotes = await fetchQuotes(numberOfQuotes: numberOfQuotes)
            }
          }
          label:
          {
            Image(systemName: "icloud.and.arrow.down.fill").font(.title)
          }
        }
        .padding()
        .background(.gray.opacity(0.3))
        .cornerRadius(15)
        
        ForEach(quotes)
        {
          row in
          
          VStack(alignment: .leading)
          {
            Text(row.quote)
            Text(row.author).font(.caption)
          }
          .padding()
          .background(gradient)
          .cornerRadius(15)
        }
      }
      .listStyle(.plain)
      .navigationTitle("Breaking Bad")
    }
  }
}

#Preview
{
  JsonView()
}
