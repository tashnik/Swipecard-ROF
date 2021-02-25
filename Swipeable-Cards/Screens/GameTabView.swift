//
//  GameTabView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/11/21.
//

import SwiftUI

struct GameTabView: View {
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    TabView {
      NavigationView {
        ContentView()
      }
      .tabItem {
        Image(systemName: "crown")
        Text("Game")
      }
      
      NavigationView {
        UsedCardsView()
      }
      .tabItem {
        Image(systemName: "greetingcard")
        Text("Cards")
      }
      
      
      GameRulesView()
        .tabItem {
          Image(systemName: "questionmark.circle")
          Text("Rules")
        }
    }
    .accentColor(colorScheme == .light ? Color.cardTableGreen : Color.neonGreen)
  }
}

struct GameTabView_Previews: PreviewProvider {
  static var previews: some View {
    GameTabView()
  }
}
