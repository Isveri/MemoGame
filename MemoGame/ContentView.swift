//
//  ContentView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["😃","🐸","🐯","🪲","🪱","🐹","😃","🐸","🐯","🪲","🪱","🐹"]
    @State var numberOfCards = 2

    var body: some View {
        
        VStack {
            ScrollView{
                cardDisplay
            }
           cardAdjuster
        }.padding()
    }
    
    
    var cardAdjuster: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View{
        return Button(symbol){
            numberOfCards += offset
        }.frame(width: 50)
        .border(Color.blue)
        .disabled(numberOfCards <= 2 && symbol == "-" || numberOfCards >= emojis.count && symbol == "+")
    }
    
    var cardDisplay: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
                    ForEach(0..<numberOfCards, id: \.self){
                        index in
                        CardView(content: emojis[index])
                        .aspectRatio(11/3, contentMode: .fit)
                    }
                }.foregroundColor(Color.blue)
    }
    var cardAdder: some View {
        adjustCardNumber(by: 2, symbol: "+")
    }
    
    var cardRemover: some View {
        adjustCardNumber(by: -2, symbol: "-")
    }
    

    
}

#Preview {
    ContentView()
}
