//
//  ProfileView.swift
//  LifeStyle
//
//  Created by Stig Højklint on 28/08/2025.
//

import SwiftUI

struct ProfileView: View
{
  var body: some View
  {
    NavigationStack
    {
      Group
      {
        EmptyView(title: "Finner ingen profil", notes: "Vennligst opprett en ny profil")
      }
      .navigationTitle("Profil")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview
{
  ProfileView()
}
