//
//  DataView.swift
//  BreakingBad
//
//  Created by Stig Orla Sørli Højklint on 14/10/2025.
//

import SwiftUI
import SwiftData

struct DataView: View
{
  @Query private var quotes: [QuoteModel]
  
  var body: some View
  {
    NavigationStack
    {
      Group
      {
        if quotes.isEmpty
        {
          EmptyView(title: "Ingen sitater er lagret", notes: "Vennligst hent data fra Breaking Bad og lagre ønskede sitater.")
        }
        else
        {
          List
          {
            MessageView(text: "Sveip fra høyre mot venstre for å slette sitater")
            
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
        }
      }
      .listStyle(.plain)
      .navigationTitle("Lagrede sitater")
    }
  }
}

#Preview
{
  DataView()
}
