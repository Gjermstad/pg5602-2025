//
//  DIceView.swift
//  01-homework-state-dices
//
//  Created by Kenneth Andre Bettum Gjermstad on 30/08/2025.
//

import SwiftUI

struct DIceView: View {
    var numberOfPips: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips)")
                .resizable()
                .frame(width: 100, height: 100)
            Button("Roll") {
                numberOfPips = Int.random(in: 1...6)
            }
        }
    }
}

#Preview {
    DIceView()
}
