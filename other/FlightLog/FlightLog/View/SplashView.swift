//
//  SplashView.swift
//  FlightLog
//
//  Created by Stig Orla Sørli Højklint on 23/10/2023.
//

import SwiftUI

struct SplashView: View
{
  @Binding var splash: Bool
  
  //  Setter startverdiene til bildene
  @State private var runway = 0.2     // Størrelse på banen
  @State private var airplane = 0.3   // Størrelse på fly
  @State private var degree = 20.0    // Setter vinkelrotasjon på fly
  @State private var offset = 200     // Setter plassering av fly
  
  var body: some View
  {
    ZStack
    {
      //LinearGradient(gradient: Gradient(colors: [.orange, .black]), startPoint: .top, endPoint: .bottom)
      RadialGradient(gradient: Gradient(colors: [.orange, .black]), center: .center, startRadius: 1, endRadius: 300)

      Image("runway2").onAppear
      {
        // Sørger for en jevn overgang fra start til sluttverdier
        withAnimation(.easeIn(duration: 3.0))
        {
          // Setter sluttverdiene til bildene
          self.runway = 0.4
          self.airplane = 0.1
          self.degree = 0
          self.offset = -100
        }
      }
      .scaleEffect(runway)
      
      Image("boeing")
        .scaleEffect(airplane)
        .rotationEffect(.degrees(degree))
        .offset(y: CGFloat(offset))
    }
    .onAppear
    {
      DispatchQueue.main.asyncAfter(deadline: .now() + 3.0)
      {
        withAnimation(.easeOut(duration: 0.5))
        {
          self.splash = false
        }
      }
    }
    .ignoresSafeArea(.all)
  }
}

#Preview
{
  SplashView(splash: .constant(true))
}
