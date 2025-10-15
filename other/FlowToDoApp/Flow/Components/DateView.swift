//
//  DateView.swift
//  Flow
//
//  Created by Stig Orla Sørli Højklint on 12/10/2025.
//

import SwiftUI

struct DateView: View
{
  @Binding var selectedDate: Date
  @Binding var isPresented: Bool
  
  var body: some View
  {
    VStack
    {
      DatePicker("Velg en dato", selection: $selectedDate, displayedComponents: .date)
        .datePickerStyle(.graphical)
        .onChange(of: selectedDate)
      {
        isPresented = false
      }
    }
    .presentationDetents([.fraction(0.5)])
    .presentationCornerRadius(20)
  }
}

#Preview
{
  DateView(selectedDate: .constant(.now), isPresented: .constant(true))
}
