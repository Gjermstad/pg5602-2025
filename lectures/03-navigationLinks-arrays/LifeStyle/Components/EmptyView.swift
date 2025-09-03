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
    var text: String;
    
    var body: some View
    {
        ContentUnavailableView("Ingen \(title) er registrert",
            systemImage: "square.stack.3d.up.slash",
            description: Text(text))
    }
}

#Preview {
    EmptyView(title: "profil", text: "Vennligst registrer en ny profil før du fortsetter.")
}
