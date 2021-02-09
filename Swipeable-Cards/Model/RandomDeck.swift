//
//  RandomDeck.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/9/21.
//

import Foundation


class RandomDeck {
  
  static let shared = RandomDeck()
  
  var returnNonRepeatedRandomNums: [Int] {
    var nonRepeatedRandomNums: [Int] = []
    
    var r = Int.random(in: 0...51)
    for _ in 0...51 {
      r = Int.random(in: 0...51, excluding: r)
      nonRepeatedRandomNums.append(r)
    }
    
    return nonRepeatedRandomNums
  }
}
