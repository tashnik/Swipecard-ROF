//
//  Swipeable_CardsApp.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/7/21.
//

import SwiftUI

@main
struct Swipeable_CardsApp: App {
  
  var usedImages = UsedImages()
  
  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(usedImages)
    }
  }
}
