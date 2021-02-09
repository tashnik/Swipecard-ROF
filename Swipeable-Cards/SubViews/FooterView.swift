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
    VStack(alignment: .center, spacing: 6) {
      Text(rule)
        .font(.callout)
        .fontWeight(.medium)
        .frame(height: 125)
        .foregroundColor(.black)
        .minimumScaleFactor(0.5)
    
    }
    .padding(.horizontal)
  }
}

struct FooterView_Previews: PreviewProvider {
  static var previews: some View {
    FooterView(rule: "Rule goes here")
  }
}

        
