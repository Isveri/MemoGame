//
//  MemoGameModel.swift
//  MemoGame
//
//  Created by student on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent : Equatable{
    
    private var cards: Array<Card>
   
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards=[]
        for pair in 0..<max(2,numberOfPairsOfCards){
            let content = cardContentFactory(pair)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card){
        
    }
    
    struct Card : Equatable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
