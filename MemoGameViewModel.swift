//
//  MemoGameViewModel.swift
//  MemoGame
//
//  Created by student on 07/11/2023.
//

import Foundation
import SwiftUI
 
class MemoGameViewModel: ObservableObject {
    
    private static let emojisTheme1 =  ["😃","😆","🙃","😳","😎","😮","😂","🫡"]
    private static let emojisTheme2 = ["🥕", "🍆", "🌽", "🍅"]
    private static let emojisTheme3 = ["🐶", "🐱", "🦁", "🐵", "🐘", "🦊", "🐢"]
    private static var emojis:[String] = emojisTheme1
    private static func createMemoGameModel() -> MemoGameModel<String> {
        return MemoGameModel<String>(numberOfPairsOfCards: 8) {
            index in
            if emojis.indices.contains(index) {
                return emojis[index]
            }else{
                return "??"
            }
        }
    }
    
    @Published private var model = createMemoGameModel()
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    private static func setEmojis(newEmojis: [String]){
        emojis = newEmojis
    }
    
    var themeColor  = Color.blue
    
    func changeTheme(theme: String){
        if(theme == "Motyw 2"){
            self.themeColor = Color.red
            MemoGameViewModel.setEmojis(newEmojis: MemoGameViewModel.emojisTheme2)
            model = MemoGameViewModel.createMemoGameModel()
            shuffle()
        }
        else if(theme == "Motyw 3"){
            self.themeColor = Color.green
            MemoGameViewModel.setEmojis(newEmojis: MemoGameViewModel.emojisTheme3)
            model = MemoGameViewModel.createMemoGameModel()
            shuffle()
        }
        else{
            self.themeColor = Color.blue
            MemoGameViewModel.setEmojis(newEmojis: MemoGameViewModel.emojisTheme1)
            model = MemoGameViewModel.createMemoGameModel()
            shuffle();
        }
    }
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(card: MemoGameModel<String>.Card){
        model.choose(card)
    }
    
}
