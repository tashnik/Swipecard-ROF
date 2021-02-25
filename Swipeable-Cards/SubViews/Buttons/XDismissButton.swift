//
//  XDismissButton.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/19/21.
//

import SwiftUI

struct XDismissButton: View {
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack {
      Circle()
        .frame(width: 30, height: 30)
        .foregroundColor(Color.black)
        .opacity(0.2)
      
      Image(systemName: "xmark")
        .imageScale(.large)
        .frame(width: 44, height: 44)
        .foregroundColor(colorScheme == .light ? Color.white : Color.neonGreen)
    }
  }
}

struct XDismissButton_Previews: PreviewProvider {
  static var previews: some View {
    XDismissButton()
  }
}
