//
//  FlowApp.swift
//  Flow
//
//  Created by Stig Højklint on 29/09/2025.
//

import SwiftData
import SwiftUI

@main struct FlowApp: App
{
  var body: some Scene
  {
    WindowGroup
    {
      MainView().modelContainer(for: TaskModel.self)
    }
  }
}
