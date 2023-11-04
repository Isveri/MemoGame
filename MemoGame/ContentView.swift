//
//  ContentView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {

    let emojisTheme1 =  ["😃","🐸","🐯","🪲","🪱","🐹","😃","🐸","🐯","🪲","🪱","🐹"]
    let emojisTheme2 = ["🥕", "🍆", "🌽", "🍅","🥕", "🍆", "🌽", "🍅"]
    let emojisTheme3 = ["🐶", "🐱", "🦁", "🐵", "🐘", "🦊", "🐢", "🐶", "🐱", "🦁", "🐵", "🐘", "🦊", "🐢"]

    let emojis = emojisTheme1.shuffled();

    @State var numberOfCards = 10
    @State var themeColor:Color = .blue

    var body: some View {
        
        VStack {
            Text("Memo").frame(alignment: .center)
            ScrollView{
                cardDisplay
            }
//            cardAdjuster
           themeSelector
        }.padding()
    }
    


    var themeSelector: some View {
        HStack {
            ThemeChangeButton(color: $themeColor, icon: "smiley", text: "Motyw 1")
                .onTapGesture(perform: {
                    changeTheme(theme:"t1")
                })
            ThemeChangeButton(color: $themeColor, icon: "carrot", text: "Motyw 2")
                .onTapGesture(perform: {
                    changeTheme(theme:"t2")
                })
            ThemeChangeButton(color: $themeColor, icon: "pawprint.circle", text: "Motyw 3")
                .onTapGesture(perform: {
                    changeTheme(theme:"t3")
                })
        }
    }

    func changeTheme(theme:String){
        if(theme == "t2"){
            self.themeColor = Color.red
            emojis = emojisTheme2.shuffled()
            numberOfCards = numberOfCards.count
        }
        else if(theme == "t3"){
            self.themeColor = Color.green
            emojis = emojisTheme2.shuffled()
            numberOfCards = numberOfCards.count
        }
        else{
            self.themeColor = Color.blue
            emojis = emojisTheme1.shuffled()
            numberOfCards = emojisTheme1.count
        }
    }

//     var cardAdjuster: some View {
//         HStack {
//             cardAdder
//             Spacer()
//             cardRemover
//         }
//     }
    
//     func adjustCardNumber(by offset: Int, symbol: String) -> some View{
//         return Button(symbol){
//             numberOfCards += offset
//         }.frame(width: 50)
//         .border(themeColor)
//         .disabled(numberOfCards <= 2 && symbol == "-" || numberOfCards >= emojis.count && symbol == "+")
//     }
    
    var cardDisplay: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
                    ForEach(0..<numberOfCards, id: \.self){
                        index in
                        CardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
                    }
                }.foregroundColor(themeColor)
    }
//     var cardAdder: some View {
//         adjustCardNumber(by: 2, symbol: "+")
//     }
    
//     var cardRemover: some View {
//         adjustCardNumber(by: -2, symbol: "-")
//     }
    

    
}

#Preview {
    ContentView()
}
