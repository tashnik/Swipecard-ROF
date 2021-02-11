//
//  GameRulesView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/11/21.
//

import SwiftUI

struct GameRulesView: View {
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.cardTableGreen, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      
      VStack {
        HeaderView()
          .padding()
        
        Text("Ring of Fire drinking game is popular among students and those people who like partying in sleepovers. Having a variation of drinks makes this game fun and it is even more fun when the group is bigger.")
          .font(.title2)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .foregroundColor(.white)
          .padding()
          .multilineTextAlignment(.center)
          .minimumScaleFactor(0.5)
        
        Text("Every player picks a card and does what the card represents, and it can be anything from choosing someone to take a drink to start a game of categories. When a player draws a king, he pours a quarter of what he is drinking into the middle cup.")
          .font(.title2)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .foregroundColor(.white)
          .padding()
          .multilineTextAlignment(.center)
          .minimumScaleFactor(0.5)
        
        Text("The game comes to an end when the last king is drawn. The player who draws the last King has to drink the concoction in the King’s cup to the last drop.")
          .font(.title2)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .foregroundColor(.white)
          .padding()
          .multilineTextAlignment(.center)
          .minimumScaleFactor(0.5)
        
        Spacer()
      }
    }
  }
}

struct GameRulesView_Previews: PreviewProvider {
  static var previews: some View {
    GameRulesView()
  }
}
