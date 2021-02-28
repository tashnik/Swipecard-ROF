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
        
        Text("King's Court, a.k.a King's Cup or Ring of Fire, is a popular drinking game among people  who like fun. Having a variation of drinks makes this game better and it is even more better when the group is bigger.")
          .font(.title2)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .foregroundColor(.white)
          .padding()
          .multilineTextAlignment(.center)
          .minimumScaleFactor(0.5)
        
        Text("Every player picks a card and does what the card represents.  It can be anything from choosing someone to take a drink or starting a game of categories.  When a player draws a king, he pours a quarter of what he is drinking into an empty cup known as the King's Cup.")
          .font(.title2)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .foregroundColor(.white)
          .padding()
          .multilineTextAlignment(.center)
          .minimumScaleFactor(0.5)
        
        Text("The player who draws the last King has to drink the concoction in the King’s Cup to the last drop.  You could reset the game from there or play on until every card is drawn.")
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
