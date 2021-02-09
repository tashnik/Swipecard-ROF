//
//  Card.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/8/21.
//

import Foundation
import SwiftUI




struct Card: Hashable, CustomStringConvertible, Identifiable {
  
  var id: Int
  var imageName: String
  var rule: String
  
  var description: String {
    return "\(imageName), id: \(id)"
  }
 
}




class CardData: ObservableObject {
  
  var maxID: Int {
      return self.cards.map { $0.id }.max() ?? 0
  }
  
  
  @Published var cards: [Card] = [
    Card(id: 0, imageName: "ace_of_spades", rule: Rules.ruleAce),
    Card(id: 1, imageName: "2_of_hearts", rule: Rules.rule2),
    Card(id: 2, imageName: "2_of_diamonds", rule: Rules.rule2),
    Card(id: 3, imageName: "2_of_spades", rule: Rules.rule2),
    Card(id: 4, imageName: "10_of_clubs", rule: Rules.rule10),
    Card(id: 5, imageName: "10_of_hearts", rule: Rules.rule10),
    Card(id: 6, imageName: "10_of_diamonds", rule: Rules.rule10),
    Card(id: 7, imageName: "10_of_spades", rule: Rules.rule10),
    Card(id: 8, imageName: "jack_of_clubs2", rule: Rules.ruleJack),
    Card(id: 9, imageName: "jack_of_hearts2", rule: Rules.ruleJack),
    Card(id: 10, imageName: "jack_of_diamonds2", rule: Rules.ruleJack),
    Card(id: 11, imageName: "jack_of_spades2", rule: Rules.ruleJack),
    Card(id: 12, imageName: "3_of_clubs", rule: Rules.rule3),
    Card(id: 13, imageName: "3_of_hearts", rule: Rules.rule3),
    Card(id: 14, imageName: "3_of_diamonds", rule: Rules.rule3),
    Card(id: 15, imageName: "3_of_spades", rule: Rules.rule3),
    Card(id: 16, imageName: "4_of_clubs", rule: Rules.rule4),
    Card(id: 17, imageName: "4_of_hearts", rule: Rules.rule4),
    Card(id: 18, imageName: "4_of_diamonds", rule: Rules.rule4),
    Card(id: 19, imageName: "4_of_spades", rule: Rules.rule4),
    Card(id: 20, imageName: "5_of_clubs", rule: Rules.rule5),
    Card(id: 21, imageName: "5_of_hearts", rule: Rules.rule5),
    Card(id: 22, imageName: "5_of_diamonds", rule: Rules.rule5),
    Card(id: 23, imageName: "5_of_spades", rule: Rules.rule5),
    Card(id: 24, imageName: "6_of_clubs", rule: Rules.rule6),
    Card(id: 25, imageName: "6_of_hearts", rule: Rules.rule6),
    Card(id: 26, imageName: "6_of_diamonds", rule: Rules.rule6),
    Card(id: 27, imageName: "6_of_spades", rule: Rules.rule6),
    Card(id: 28, imageName: "7_of_clubs", rule: Rules.rule7),
    Card(id: 29, imageName: "7_of_hearts", rule: Rules.rule7),
    Card(id: 30, imageName: "7_of_diamonds", rule: Rules.rule7),
    Card(id: 31, imageName: "7_of_spades", rule: Rules.rule7),
    Card(id: 32, imageName: "8_of_clubs", rule: Rules.rule8),
    Card(id: 33, imageName: "8_of_hearts", rule: Rules.rule8),
    Card(id: 34, imageName: "8_of_diamonds", rule: Rules.rule8),
    Card(id: 35, imageName: "8_of_spades", rule: Rules.rule8),
    Card(id: 36, imageName: "9_of_clubs", rule: Rules.rule9),
    Card(id: 37, imageName: "9_of_hearts", rule: Rules.rule9),
    Card(id: 38, imageName: "9_of_diamonds", rule: Rules.rule9),
    Card(id: 39, imageName: "9_of_spades", rule: Rules.rule9),
    Card(id: 40, imageName: "king_of_clubs2", rule: Rules.ruleKing),
    Card(id: 41, imageName: "king_of_hearts2", rule: Rules.ruleKing),
    Card(id: 42, imageName: "king_of_diamonds2", rule: Rules.ruleKing),
    Card(id: 43, imageName: "king_of_spades2", rule: Rules.ruleKing),
    Card(id: 44, imageName: "queen_of_clubs2", rule: Rules.ruleQueen),
    Card(id: 45, imageName: "queen_of_hearts2", rule: Rules.ruleQueen),
    Card(id: 46, imageName: "queen_of_diamonds2", rule: Rules.ruleQueen),
    Card(id: 47, imageName: "queen_of_spades2", rule: Rules.ruleQueen),
    Card(id: 48, imageName: "ace_of_clubs", rule: Rules.ruleAce),
    Card(id: 49, imageName: "ace_of_hearts", rule: Rules.ruleAce),
    Card(id: 50, imageName: "ace_of_diamonds", rule: Rules.ruleAce),
    Card(id: 51, imageName: "2_of_clubs", rule: Rules.rule2),

  ]
  
}
