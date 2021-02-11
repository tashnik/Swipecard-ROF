//
//  UsedCardsView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/11/21.
//

import SwiftUI

struct UsedCardsView: View {
  
  @EnvironmentObject var usedImages: UsedImages
  @Environment(\.colorScheme) var colorScheme
  
  let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
  
  @State var ruleIndex = 0
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [colorScheme == .light ? Color.neonGreen : Color.cardTableGreen, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      ScrollView(showsIndicators: false) {
        LazyVGrid(columns: columns) {
          ForEach(Array(zip(usedImages.images, usedImages.rules)), id: \.0) { item in
           
            NavigationLink(
              destination: RulesSheetView(rule: item.1),
              label: {
                Image(item.0)
                  .resizable()
                  .scaledToFit()
                  .frame(width: 175, height: 175, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                  .padding()
                  
              })
             
          }
        }
      }
      .padding()
    }
    .onAppear {
        usedImages.startNewGame = false
    }
    .navigationBarTitle("Used Cards").foregroundColor(.white)
  }
}

struct UsedCardsView_Previews: PreviewProvider {
  static var previews: some View {
    UsedCardsView()
  }
}
