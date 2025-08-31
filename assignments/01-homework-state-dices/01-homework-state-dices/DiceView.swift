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
            Image(systemName: "die.face.\(numberOfPips).fill")
                // resizable er nødvendig for å kunne endre på størrelsen på terningene
                .resizable()
                // frame setter maks størrelse på terningene
                .frame(maxWidth: 100, maxHeight: 100)
                // aspectRatio 1 gir 1:1, og sammen med .fit må terningen forminskes om nødvendig
                .aspectRatio(1, contentMode: .fit)
                // Her brukes både primær og sekunderfarge for å få hvite terninger med svart pip (les mer om ikoner her https://developer.apple.com/design/human-interface-guidelines/sf-symbols)
                .foregroundStyle(.black, .white)
            
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
