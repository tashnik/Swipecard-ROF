//
//  CardView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/7/21.
//

import SwiftUI

struct CardView: View {
  
  var randomCard: Int
  
  @State private var translation: CGSize = .zero
  @State private var rotationRight: CGFloat = 0
  @State private var dontShowSecondCard = false
  @State private var dontShowFirstCard = false
  
  @EnvironmentObject var usedImages: UsedImages
  
  var card: Card
  var onRemove: (_ card: Card) -> Void
  var thresholdPercentage: CGFloat = 0.5
  var cardWidth: CGFloat = 300
  var cardHeight: CGFloat = 450
  
  init(card: Card, randomCard: Int, onRemove: @escaping (_ card: Card) -> Void) {
    self.card = card
    self.randomCard = randomCard
    self.onRemove = onRemove
  }
  
  var body: some View {
    
    GeometryReader { geometry in
 
      let width = geometry.size.width * 0.9
      let height = width * 1.452
      
      ZStack {
        Image(dontShowSecondCard ? " " : "cardBack_red4")
          .resizable()
          .scaledToFit()
          .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * Double.random(in: 9...14)), anchor: .bottom)
          .frame(width: width, height: height)
        
        Image(dontShowFirstCard ? " " : "cardBack_red4")
          .resizable()
          .scaledToFit()
          .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * Double.random(in: 20...25)), anchor: .bottom)
          .frame(width: width, height: height)
      
        VStack(alignment: .center) {
          
          Image(card.imageAndRules[randomCard].imageName)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
          
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
                
                usedImages.images.append(card.imageAndRules[randomCard].imageName)
                usedImages.rules.append(card.imageAndRules[randomCard].rule)
                
                self.onRemove(self.card)
              } else {
                self.translation = .zero
              }
            }
        )
      }
    }
    .onAppear {
      self.dontShowSecondCard = usedImages.dontShowSecondCard
      self.dontShowFirstCard = usedImages.dontShowFirstCard
    }
 //   .padding()
  }
  
  ///MARK: FUNCTIONS
  
  private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
    gesture.translation.width / geometry.size.width
  }
}


struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(card: Card(id: 0), randomCard: 0, onRemove: { _ in
      
    }).frame(height: 472).padding()
  }
}
