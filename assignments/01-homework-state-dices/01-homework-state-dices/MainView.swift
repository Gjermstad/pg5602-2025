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
                Button("Remove Dice") {
                    withAnimation {
                        numberOfDice -= 1
                    }
                }
                .buttonStyle(.bordered)
                .disabled(numberOfDice == 1)
                
                Button("Add Dice") {
                    withAnimation {
                        numberOfDice += 1
                    }
                }
                .buttonStyle(.bordered)
                .disabled(numberOfDice == 5)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    MainView()
}
