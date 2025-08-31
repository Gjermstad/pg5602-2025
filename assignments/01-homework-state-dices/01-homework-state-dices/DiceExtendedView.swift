//
//  DiceExtendedView.swift
//  01-homework-state-dices
//
//  Created by Kenneth André Bettum Gjermstad on 31/08/2025.
//

import SwiftUI

// This file is my try on the "Continue practice" for the dice app at https://developer.apple.com/tutorials/develop-in-swift/buttons-and-state-conclusion and is based on the final DiceView at the end of the tutorial.

struct DiceExtendedView: View {
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                // resizable er nødvendig for å kunne endre på størrelsen på terningene
                .resizable()
                // frame setter maks størrelse på terningene
                .frame(maxWidth: 100, maxHeight: 100)
                // aspectRatio 1 gir 1:1, og sammen med .fit må terningen forminskes om nødvendig
                .aspectRatio(1, contentMode: .fit)
                // Her brukes både primær og sekunderfarge for å få hvite terninger med svart pip (les mer om ikoner her https://developer.apple.com/design/human-interface-guidelines/sf-symbols)
                .foregroundStyle(.black, .white)
                // La til så man kan trykke rett på terningen for å kaste/få nytt tall istedenfor en knapp under
                .onTapGesture {
                    withAnimation {
                        numberOfPips = Int.random(in: 1...6)
                    }
                }
        }
    }
}

#Preview {
    DiceExtendedView()
}
