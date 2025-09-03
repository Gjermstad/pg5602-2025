//
//  EmptyView.swift
//  LifeStyle
//
//  Created by Kenneth Andre Bettum Gjermstad on 28/08/2025.
//

import SwiftUI

struct EmptyView: View
{
    var title: String;
    var notes: String;
    
    // I konstruktøren kan vi legge til Default-verdier som brukes om det ikke gies verdier til
    // View'et. Konstruktører er veldig vanlig.
    init(title: String = "Ingen data registrert", notes: String = "Vennligst legg til data") {
        // self.title er selve variabelen som er lokalt i View'et
        // mens title er parameteret som gies inn til
        self.title = title
        self.notes = notes
    }
    
    var body: some View
    {
        ContentUnavailableView(title,
            systemImage: "square.stack.3d.up.slash",
            description: Text(notes))
    }
}

#Preview {
    EmptyView()
}
