//
//  ContentView.swift
//  01-tutorial-dynamic-content
//
//  Created by Kenneth Andre Bettum Gjermstad on 03/09/2025.
//  Basert på Apple sin tutorial (https://developer.apple.com/tutorials/develop-in-swift/create-dynamic-content)

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    MainView()
}
