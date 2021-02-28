//
//  RulesSheetView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/11/21.
//

import SwiftUI

struct RulesSheetView: View {
  
  @Environment(\.colorScheme) var colorScheme
  
  var rule: String
  
  @State var noEmojiRule: String = ""
  @State var emoji: String = "👑"
  
  var body: some View {
    
    ZStack {
      
      LinearGradient(gradient: Gradient(colors: [Color.cardTableGreen, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      
      VStack {
        Spacer()
        
        Text(emoji)
          .font(.system(size: 280))
        
        Spacer()
        
        Text(rule.replacingOccurrences(of: emoji, with: ""))
          .font(.title)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .foregroundColor(colorScheme == .light ? Color.white : .primary)
          .padding()
          .multilineTextAlignment(.center)
          .minimumScaleFactor(0.5)
        
        Spacer()
      }
      
    }
    .onAppear {
      if rule.contains("🗡") {
        self.emoji = "🗡"
      } else if rule.contains("👸") {
        self.emoji = "👸"
      } else if rule.contains("👑") {
        self.emoji = "👑"
      } else if rule.contains("😳") {
        self.emoji = "😳"
      } else if rule.contains("🎤") {
        self.emoji = "🎤"
      } else if rule.contains("💁‍♀️") {
        self.emoji = "💁‍♀️"
      } else if rule.contains("🤴") {
        self.emoji = "🤴"
      } else if rule.contains("👬") {
        self.emoji = "👬"
      } else if rule.contains("🌊") {
        self.emoji = "🌊"
      } else if rule.contains("👍") {
        self.emoji = "👍"
      } else if rule.contains("☁️") {
        self.emoji = "☁️"
      } else if rule.contains("📣") {
        self.emoji = "📣"
      } else if rule.contains("🤔") {
        self.emoji = "🤔"
      }
    }
  }
}

struct RulesSheetView_Previews: PreviewProvider {
  static var previews: some View {
    RulesSheetView(rule: "Placeholder rule")
  }
}
