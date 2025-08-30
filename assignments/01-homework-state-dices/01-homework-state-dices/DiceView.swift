//
//  DIceView.swift
//  01-homework-state-dices
//
//  Created by Kenneth Andre Bettum Gjermstad on 30/08/2025.
//

import SwiftUI

struct DiceView: View {
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips)")
                // resizable er nødvendig for å kunne endre på størrelsen på terningene
                .resizable()
                // frame setter maks størrelse på terningene
                .frame(maxWidth: 100, maxHeight: 100)
                // aspectRatio 1 gir 1:1, og sammen med .fit må terningen forminskes om nødvendig
                .aspectRatio(1, contentMode: .fit)
            
            Button("Roll") {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DiceView()
}
