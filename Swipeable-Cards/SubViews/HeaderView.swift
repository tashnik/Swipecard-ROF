//
//  HeaderView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/7/21.
//

import SwiftUI

struct HeaderView: View {
  
  var body: some View {
    
    VStack {
      HStack(spacing: 3) {
        VStack(alignment: .center) {
          Text("Ring of Fire")
            .font(.custom("Copperplate-Bold", size: 22))
            .bold()
            .foregroundColor(.red)
        }
        
        Spacer()
        
        Image(systemName: "flame.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 40, height: 40)
          .foregroundColor(.orange)
          .padding(.leading)
        
        Image(systemName: "flame.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 40, height: 40)
          .foregroundColor(Color.fireColor)
        
        Image(systemName: "flame.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 40, height: 40)
          .foregroundColor(.red)
        
        
      }
      .padding()
    }
    .background(Color.yellow)
    .cornerRadius(12)
    .shadow(radius: 12)
    
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView()
  }
}
