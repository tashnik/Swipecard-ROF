//
//  EditRulesView.swift
//  Swipeable-Cards
//
//  Created by Tashnik on 2/17/21.
//

import SwiftUI
import UIKit

struct EditRulesView: View {
  
  @Binding var randomCard: Int
  @Binding var cardImageName: String
  
  @Environment(\.presentationMode) var presentationMode
  
  @EnvironmentObject var usedImages: UsedImages
  
  @State var newRule = ""
  
  let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.cardTableGreen, Color.cardTableGreen,  Color.black]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      
      VStack {
        HStack {
          Spacer()
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            XDismissButton()
          }
          
        }
        
        Text("Decree a secret command that will be revealed when the next person draws a card (e.g. Truth or Dare).  This should only be used once per game by each player.")
          .font(.custom("Kefa Regular", size: 24))
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .foregroundColor(.white)
          .padding()
          .multilineTextAlignment(.center)
          .minimumScaleFactor(0.5)
        
        TextEditor(text: $newRule)
          .font(.title)
          .frame(height: 150)
          .background(Color.red)
          .cornerRadius(12)
          .padding()
          .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
        
        Button {
          self.hideKeyboard()
          presentationMode.wrappedValue.dismiss()
        } label: {
          VStack {
            Text("Submit")
              .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
              .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
              .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
              .foregroundColor(.yellow)
              .background(Color.fireColor).opacity(0.8)
              .cornerRadius(12)
              .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
          }
        }
        
        Text("♚")
          .font(.custom("Kefa Regular", size: 180))
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .foregroundColor(Color.fireColor)
          .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
        Spacer()
      }

      .padding()
      .onDisappear {
        if newRule != "" {
          usedImages.newRule = newRule
          usedImages.useNewRule = true
        }
      }
    }
  }
}

//struct EditRulesView_Previews: PreviewProvider {
//  static var previews: some View {
//    EditRulesView(randomCard: .constant(5), cardImageName: .constant(""))
//  }
//}
