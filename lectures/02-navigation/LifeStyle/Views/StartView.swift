//
//  StartView.swift
//  LifeStyle
//
//  Created by Kenneth Andre Bettum Gjermstad on 28/08/2025.
//

import SwiftUI

struct StartView: View
{
    var body: some View
    {
        // NavigationStack er nødvendig for å kunne ha Title
        NavigationStack
        {
            List
            {
                
            }
            // toolbar brukes for å få opp logoen på toppen
            .toolbar
            {
                // Plasserer logoen på toppen
                ToolbarItem(placement: .principal)
                {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                }
                // placement: .topBarTrailing plasserer menyen på høyre side
                ToolbarItem(placement: .topBarTrailing)
                {
                    // Menu setter opp en drawer meny
                    Menu
                    {
                        Button("Nytt produkt")
                        {
                            // kode som skal gjøre noe
                        }
                        Button("Nytt produkt 2")
                        {
                            // kode som skal gjøre noe
                        }
                        Button("Nytt produkt 3")
                        {
                            // kode som skal gjøre noe
                        }
                        Button("Nytt produkt 4")
                        {
                            // kode som skal gjøre noe
                        }
                    }
                    // label brukes for meny i øvre høyre hjørne
                    label:
                    {
                        // line.3.horizontal = hamburgermeny
                        // ellipsis = meny med ...
                        // ellipsis.circle legger sirkel rundt ...
                        Image(systemName: "ellipsis.circle").font(.title2)
                    }
                }
            }
        }
    }
}

#Preview {
    StartView()
}
