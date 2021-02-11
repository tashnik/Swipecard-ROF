//
//  RulesSheetView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/11/21.
//

import SwiftUI

struct RulesSheetView: View {
  
  var rule: String
  
  var body: some View {
    Text(rule)
      .font(.title)
      .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
      .foregroundColor(.primary)
      .padding()
      .multilineTextAlignment(.center)
      .minimumScaleFactor(0.5)
  }
}

struct RulesSheetView_Previews: PreviewProvider {
  static var previews: some View {
    RulesSheetView(rule: "Placeholder rule")
  }
}
