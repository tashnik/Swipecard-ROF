//
//  CardView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/7/21.
//

import SwiftUI

struct CardView: View {
  
  @StateObject var cardData = CardData()
  @State var randomCard = Int.random(in: 0..<52)
  @State private var translation: CGSize = .zero
  
  var card: Card
  var onRemove: (_ card: Card) -> Void
  var thresholdPercentage: CGFloat = 0.5
  
  init(card: Card, onRemove: @escaping (_ card: Card) -> Void) {
    self.card = card
    self.onRemove = onRemove
  }
  
  var body: some View {
    
    GeometryReader { geometry in
      
      VStack(alignment: .center) {
        Image(card.imageName)
          .resizable()
          .scaledToFit()
          .frame(width: geometry.size.width, height: geometry.size.height * 1.08)
          .clipped()
        
        FooterView(rule: card.rule)
      }
      .background(Color.white)
      .cornerRadius(12)
      .shadow(radius: 5)
      .animation(.interactiveSpring())
      .offset(x: self.translation.width, y: 0)
      .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
      .gesture(
        DragGesture()
          .onChanged { value in
            self.translation = value.translation
          }.onEnded { value in
            if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
              self.onRemove(self.card)
            } else {
              self.translation = .zero
            }
          }
      )
    }
    .padding()
  }
  
  private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
    gesture.translation.width / geometry.size.width
  }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
      CardView(card: Card(id: 0, imageName: "2_of_clubs", rule: Rules.rule2), onRemove: { _ in
        
}).frame(height: 400).padding()
    }
}
