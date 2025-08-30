//
//  Home.swift
//  leksjon1
//
//  Created by Kenneth Andre Bettum Gjermstad on 27/08/2025.
//

import SwiftUI

struct HomeView: View
{
    var body: some View
    {
        // Vi legger NavigationStack utenfor listen
        NavigationStack
        {
            List
            {
                ForEach(1...20, id: \.self)
                {
                    number in Text("punkt \(number)")
                }
            }
            .navigationTitle("Hjem") // navigationTitle må legges på første del inni NavigationStack og ikke på den
        }
    }
}

#Preview {
    HomeView()
}
