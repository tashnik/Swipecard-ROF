//
//  UsedImages.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/11/21.
//

import Foundation
import SwiftUI

class UsedImages: ObservableObject, Identifiable {
  
  var id = UUID()
  var count: Int = 1
  
  @Published var startNewGame = true
  @Published var images: [String] = []
  @Published var rules: [String] = []
  @Published var kingCount = 0
  
  func addImage(image: String) {
    self.images.append(image)
  }
  
  func addToCount() {
    self.count += 1
  }
}
