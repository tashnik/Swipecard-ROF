//
//  ContentView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/7/21.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject var cardData = CardData()
  
  var body: some View {
  
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.cardTableGreen, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      VStack {
        GeometryReader { geometry in
          VStack {
            Button {

              print(RandomDeck.shared.returnNonRepeatedRandomNums)
              
            } label: {
              HeaderView()
                .padding(.horizontal)
            }
           
            ZStack {
              ForEach(cardData.cards) { card in
                
                if (cardData.maxID - 2)...cardData.maxID ~= card.id {
                  CardView(card: card, onRemove: { removedCard in
                    print("removed \(card.id)")
                    cardData.cards.removeAll { $0.id == removedCard.id }
                   })
                  .animation(.spring()) 
                  .frame(width: self.getCardWidth(geometry, id: card.id), height: 500)
                  .offset(x: 0, y: self.getCardOffset(geometry, id: card.id))
                  .padding(.bottom)
                }
              }
            }
          }
        }
      }
      .padding()
    }
  }
  
  ///MARK:  FUNCTIONS
  
  func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
    let offset: CGFloat = CGFloat(cardData.cards.count - 1 - id) * 10
    return geometry.size.width - offset
  }
  
  
  func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
    return  CGFloat(cardData.cards.count - 1 - id) * 10
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}



