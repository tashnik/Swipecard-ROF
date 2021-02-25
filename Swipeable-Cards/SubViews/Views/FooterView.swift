//
//  FooterView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/7/21.
//

import SwiftUI

struct FooterView: View {
  
  @StateObject var cardData = CardData()
  
  var rule: String
  var height: CGFloat
  
  var body: some View {
    VStack {
      Text(rule)
        .font(.largeTitle)
        .fontWeight(.bold)
        .frame(height: height)
        .foregroundColor(.white)
        .minimumScaleFactor(0.3)
        .multilineTextAlignment(.center)
        .padding(.trailing)
    }
//    .padding(.top, 15)
  }
}

struct FooterView_Previews: PreviewProvider {
  static var previews: some View {
    FooterView(rule: "Rule goes here", height: 80)
  }
}

        
