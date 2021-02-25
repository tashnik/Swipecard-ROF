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
  @State var showImage = true
  @State var showEditRulesView = false
  @State var cardImageName = ""
  
  @EnvironmentObject var usedImages: UsedImages
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
        
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.cardTableGreen, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      VStack {
        GeometryReader { geometry in
          let width = geometry.size.width * 0.83
          let height = width * 1.252
          VStack {
            ZStack {
             
              VStack {
                HStack {
                  Image(showImage ? "cardBack_red4" : " ")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height * 1.17)
                    .padding(.leading, 37)

                    Spacer()
                }
                Spacer()
                  .frame(height: 50)
              }
              
              ForEach(cardData.cards) { card in
               
                if (cardData.maxID - 0)...cardData.maxID ~= card.id {
                  
                    CardView(card: card, randomCard: randomCard, onRemove: { removedCard in
                      
                      cardData.cards.removeAll { $0.id == removedCard.id
                      }
                      
                      if count <= 51 {
                        randomCard = randomCards[count]
                        count += 1
                        
                        if count == 52 {
                          usedImages.dontShowFirstCard.toggle()
                        }
                        
                        if count == 51 {
                          usedImages.dontShowSecondCard.toggle()
                        }
                      }
                      
                      else {
                        showAlert = true
                        count = 1
                        usedImages.images.removeAll()
                        showImageAndRule = false
                      }
                    })
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                    .frame(width: self.getCardWidth(geometry, id: card.id), height: self.getCardWidth(geometry, id: card.id) * 1.252)
                    .offset(x: 0, y: self.getCardOffset(geometry, id: card.id))
                    .transition(.move(edge: .top))
                    .padding(.top)
                    .padding(.leading, 25)
                    .padding(.bottom, 25)
                    .onAppear {
                      if usedImages.useNewRule {
                        currentRule = usedImages.newRule
                        usedImages.useNewRule.toggle()
                      } else {
                        currentRule = card.imageAndRules[randomCard].rule
                      }
                      
                      cardImageName = card.imageAndRules[randomCard].imageName
                      
                      if count >= 50  {
                        showImage = false
                      }
                      showImageAndRule = true
                      print(count)
                    }
                  }
                }
              }
              
            FooterView(rule: showImageAndRule ? currentRule : " ", height: geometry.size.height * 0.10)
                .animation(.easeIn)
        //        .padding(.bottom, 40)
                .padding(.trailing)
              Spacer()
            }
            .alert(isPresented: $showAlert, content: {
              Alert(title: Text("Restart"), message: Text("Shuffle the deck and start over?"), primaryButton: .default(Text("Yes"), action: {
                let newCardData = CardData()
                cardData.cards = newCardData.cards
                usedImages.startNewGame = true
                usedImages.images.removeAll()
                usedImages.rules.removeAll()
                showImage = true
                usedImages.dontShowFirstCard = false
                usedImages.dontShowSecondCard = false
                randomCards = uniqueRandoms(numberOfRandoms: 52, minNum: 0, maxNum: 51)
                randomCard = randomCards[0]
                currentRule = cardData.cards[randomCard].imageAndRules[randomCard].rule
                count = 1
              
              }), secondaryButton: .default(Text("No")))
            })
          }
          .padding()
          .sheet(isPresented: $showEditRulesView, content: {
            EditRulesView(randomCard: $randomCard, cardImageName: $cardImageName)
          })
         
        .navigationBarTitle("King's Chalice")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                              Button {
                                showAlert.toggle()
                                
                              } label: {
                                Text("Restart")
                                  .foregroundColor(.black)
                              }
                              .frame(width: 70, height: 35)
                              .background(colorScheme == .light ? Color.white : Color.neonGreen)
                              .cornerRadius(12)
                              .shadow(radius: 12)
        
        )
        .onAppear {
          if usedImages.startNewGame {
            randomCards = uniqueRandoms(numberOfRandoms: 52, minNum: 0, maxNum: 51)
            randomCard = randomCards[0]
          }
        }
        Spacer()
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
    let offset: CGFloat = CGFloat(cardData.cards.count - 1 - id)// * 10
    return geometry.size.width - offset
  }
  
  func getCardHeight(_ geometry: GeometryProxy, id: Int) -> CGFloat {
    let offset: CGFloat = CGFloat(cardData.cards.count - 1 - id)// * 10
    return geometry.size.height - offset
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



