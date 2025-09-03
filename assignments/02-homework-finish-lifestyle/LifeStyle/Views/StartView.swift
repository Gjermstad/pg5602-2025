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
            List {
                ForEach(emojis, id: \.self)
                {
                    emoji in Text(emoji)
                }                
            }
        }
    }
}

#Preview {
    StartView()
}
