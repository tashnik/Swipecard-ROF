//
//  HeaderView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/7/21.
//

import SwiftUI

struct HeaderView: View {
  
  @State private var animationAmount: CGFloat = 1
  
  var body: some View {
    
    VStack {
      HStack(spacing: 10) {
        
        Image(systemName: "flame.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 50, height: 50)
          .foregroundColor(.orange)
          .padding(.trailing)
          .scaleEffect(animationAmount)
          .animation(Animation.easeInOut(duration: 2)
                        .repeatForever(autoreverses: true))
        
        VStack(alignment: .center) {
          Text("King's Chalice")
            .font(.custom("Kefa Regular", size: 24))
            .bold()
            .foregroundColor(.red)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .padding(.leading)
        
        Text("👑")
          .font(.largeTitle)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .shadow(radius: 10)
        
        Spacer()
        
        Image(systemName: "flame.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 50, height: 50)
          .foregroundColor(.red)
          .scaleEffect(animationAmount)
          .animation(Animation.easeInOut(duration: 2)
                        .repeatForever(autoreverses: true))
        
        
      }
      .padding()
    }
    .background(Color.yellow)
    .cornerRadius(12)
    .shadow(radius: 12)
    .onAppear {
      self.animationAmount += 1
    }
    .onDisappear {
      self.animationAmount = 0
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView()
  }
}
