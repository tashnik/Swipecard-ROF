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
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(rule)
        .font(.title2)
        .fontWeight(.bold)
        .frame(height: 125)
        .foregroundColor(.white)
        .minimumScaleFactor(0.5)
    }
  }
}

struct FooterView_Previews: PreviewProvider {
  static var previews: some View {
    FooterView(rule: "Rule goes here")
  }
}

        
