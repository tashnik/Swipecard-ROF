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
  @State var randomCard = 0
  @State var randomCards: [Int] = []
  @State var showAlert = false
  @State var currentRule = ""
  @State var showImageAndRule = true
  
  @EnvironmentObject var usedImages: UsedImages
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.cardTableGreen, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      
      VStack(spacing: 5) {
        
        Image(showImageAndRule ? "cardBack_red4" : " ")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 250, height: 475)
          .padding(.horizontal)
        
        Spacer()
          .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110)
      }
      GeometryReader { geometry in
        VStack {
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
                  showImageAndRule = false
                }
              })
              .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
              .transition(.move(edge: .top))
              .frame(width: self.getCardWidth(geometry, id: card.id), height: 480)
              .offset(x: 0, y: self.getCardOffset(geometry, id: card.id))
              .padding(.bottom)
              .padding(.trailing, 25)
              .onAppear {
                currentRule = card.imageAndRules[randomCard].rule
                showImageAndRule = true
              }
            }
          }
          
          Spacer()
          
          FooterView(rule: showImageAndRule ? currentRule : " ")
            .animation(.easeIn)
            .padding(.vertical, 40)
            .padding(.trailing)
        }
        .alert(isPresented: $showAlert, content: {
          Alert(title: Text("Restart"), message: Text("Shuffle the deck and start over?"), primaryButton: .default(Text("Yes"), action: {
            let newCardData = CardData()
            cardData.cards = newCardData.cards
            usedImages.startNewGame = true
            usedImages.images.removeAll()
            usedImages.rules.removeAll()
            randomCards = uniqueRandoms(numberOfRandoms: 52, minNum: 0, maxNum: 51)
            randomCard = randomCards[0]
            currentRule = cardData.cards[randomCard].imageAndRules[randomCard].rule
            count = 1
          
          }), secondaryButton: .default(Text("No")))
        })
        
      }
      .padding()
    }
    .navigationBarTitle("Ring of Fire")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarItems(trailing:
                          
                          Button {
                            showAlert.toggle()
                            
                          } label: {
                            Text("Restart")
                              .foregroundColor(Color.black)
                          }
                          .frame(width: 70, height: 35)
                          .background(colorScheme == .light ? Color.white : Color.neonGreen)
                          .cornerRadius(12)
                          .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    )
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



