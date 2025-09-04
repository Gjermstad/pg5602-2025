//
//  EmptyView.swift
//  03-homework-ratatouille
//
//  Created by Kenneth Andre Bettum Gjermstad on 04/09/2025.
//

import SwiftUI

struct EmptyStateView: View {
  @State private var title: String
  
  // Konstruktør
  init(title: String = "Ingen data lagret") {
    self.title = title
  }
  
    var body: some View {
      ContentUnavailableView(title, systemImage: "square.stack.3d.up.slash")
    }
}

#Preview {
  EmptyStateView(title: "Ingen matoppskrifter")
}
