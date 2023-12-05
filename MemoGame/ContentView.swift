//
//  ContentView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: MemoGameViewModel
    @State var lastScoreChange: (Int, String) = (0,"")
    var body: some View {
        
        VStack {
            Text("Memo").frame(alignment: .center).font(.largeTitle)
            ScrollView{
                cardDisplay.animation(.default, value: viewModel.cards)
            }
            HStack{
                Text("Wynik: " + String(viewModel.score)).font(.title)
                Spacer()
                Button("SHUFFLE"){
                    withAnimation(.interactiveSpring(response: 1, dampingFraction: 1.5)){
                        viewModel.shuffle()
                    }
                }.font(.title2).padding(20).foregroundColor(viewModel.themeColor)
            }
            Spacer()
           themeSelector
        }.padding()
    }
    


    var themeSelector: some View {
        HStack {
            ThemeChangeButton(viewModel: viewModel, icon: "smiley", text: "Motyw 1")
            Spacer()
            ThemeChangeButton(viewModel: viewModel, icon: "carrot", text: "Motyw 2")
            Spacer()
            ThemeChangeButton(viewModel: viewModel, icon: "pawprint.circle", text: "Motyw 3")
        }
    }

    var cardDisplay: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)], spacing: 0){
            let lastScore = viewModel.score
            ForEach(viewModel.cards){
                card in
                CardView(card,viewModel.themeColor)
                    .aspectRatio(2/3, contentMode: .fit)
                    .overlay(card.isFaceUp ? FlyingNumber(number: scoreChange(cardId: card.id)) : nil)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card: card)
                        lastScoreChange = (viewModel.score - lastScore, card.id)
                    }
            }
        }.foregroundColor(viewModel.themeColor)
    }
    
    func scoreChange(cardId:String) -> Int {
           if(lastScoreChange.1 == cardId){
               return lastScoreChange.0
           } else {
               return 0
           }
       }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MemoGameViewModel())
    }
}
