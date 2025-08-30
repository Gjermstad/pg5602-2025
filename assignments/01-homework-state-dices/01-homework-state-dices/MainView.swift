//
//  ContentView.swift
//  01-homework-state-dices
//
//  Created by Kenneth Andre Bettum Gjermstad on 30/08/2025.
//

import SwiftUI

struct MainView: View {
    @State private var numberOfDice: Int = 3
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle
                    .lowercaseSmallCaps()
                    .bold())
            
            HStack {
                ForEach(1...numberOfDice, id: \.description) {_ in
                    DiceView()
                }
            }
            
            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        numberOfDice -= 1
                    }
                }
                // disabled gjør knappen avslått når true (som en if-setning)
                .disabled(numberOfDice == 1)
                
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDice += 1
                    }
                }
                .disabled(numberOfDice == 5)
            }
            .padding()
            // labelStyle med iconOnly sørger for at teksten til knappen ikke vises, men fremdeles er tilgjengelig for VoiceOver for synshemmede
            .labelStyle(.iconOnly)
            .font(.title)
        }
        .padding()
    }
}

#Preview {
    MainView()
}
