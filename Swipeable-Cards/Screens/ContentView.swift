//
//  ContentView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/7/21.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject var cardData = CardData()
  @State var count = 1
  @State var kingCount = 0
  @State var randomCard = Int.random(in: 0...51)
  @State var randomCards: [Int] = []
  @State var showAlert = false
  
  @EnvironmentObject var usedImages: UsedImages
  
  var body: some View {
  
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.cardTableGreen, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      VStack {
        GeometryReader { geometry in
          VStack {
           
            ZStack {
              VStack {
                HStack {
                  Image("cardBack_red4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 360, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.trailing)
                  
                  Spacer()
                }
                Spacer()
                  .frame(height: 15)
              }
              .padding()
              .alert(isPresented: $showAlert, content: {
                Alert(title: Text("No more cards!"), message: Text("Play again?"), primaryButton: .default(Text("I'm still sober"), action: {
                  let newCardData = CardData()
                  cardData.cards = newCardData.cards
                  usedImages.startNewGame = true
                  randomCards = uniqueRandoms(numberOfRandoms: 52, minNum: 0, maxNum: 51)
                  randomCard = randomCards[0]
                  print("Start again")
                }), secondaryButton: .cancel())
              })
              
              ForEach(cardData.cards) { card in
                
                if (cardData.maxID - 0)...cardData.maxID ~= card.id {
                  
                  CardView(card: card, randomCard: randomCard, onRemove: { removedCard in
         
                    cardData.cards.removeAll { $0.id == removedCard.id
                    }
                    
                    if count <= 51 {
                      randomCard = randomCards[count]
                      count += 1
                    } else {
                      showAlert = true
                      count = 1
                      usedImages.images.removeAll()
                    }
                    
                
                   })
                  .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                  .transition(.move(edge: .leading))
                  .frame(width: self.getCardWidth(geometry, id: card.id), height: 480)
                  .offset(x: 0, y: self.getCardOffset(geometry, id: card.id))
                  .padding(.bottom)
                  .padding(.trailing, 25)
                }
              }
            }
          }
        }
      }
      .padding()
      
    }
    .onAppear {
      if usedImages.startNewGame {
        randomCards = uniqueRandoms(numberOfRandoms: 52, minNum: 0, maxNum: 51)
        randomCard = randomCards[0]
      }
      
    }
    
  }
  
  ///MARK:  FUNCTIONS
  
  func uniqueRandoms(numberOfRandoms: Int, minNum: Int, maxNum: UInt32) -> [Int] {
      var uniqueNumbers = Set<Int>()
      while uniqueNumbers.count < numberOfRandoms {
          uniqueNumbers.insert(Int(arc4random_uniform(maxNum + 1)) + minNum)
      }
      return uniqueNumbers.shuffled()
  }
  
  func uniqueRandoms(numberOfRandoms: Int, minNum: Int, maxNum: UInt32, blackList: Int?) -> [Int] {
      var uniqueNumbers = Set<Int>()
      while uniqueNumbers.count < numberOfRandoms {
          uniqueNumbers.insert(Int(arc4random_uniform(maxNum + 1)) + minNum)
      }
      if let blackList = blackList {
          if uniqueNumbers.contains(blackList) {
              while uniqueNumbers.count < numberOfRandoms+1 {
                  uniqueNumbers.insert(Int(arc4random_uniform(maxNum + 1)) + minNum)
              }
              uniqueNumbers.remove(blackList)
          }
      }
      return uniqueNumbers.shuffled()
  }
  
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



