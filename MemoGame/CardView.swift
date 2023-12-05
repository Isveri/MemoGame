//
//  CardView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct CardView: View {
    var card: MemoGameModel<String>.Card
    var color: Color
    init(_ card:MemoGameModel<String>.Card, _ color: Color) {
        self.card = card
        self.color = color
    }
    
    var body: some View {
        CirclePart(endAngle: .degrees(120))
            .fill(color)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(color, lineWidth: 2))
            .TransformIntoCard(with: card.content, isFaceUp: card.isFaceUp, isMatched: card.isMatched)
            .rotation3DEffect(.degrees(card.isFaceUp ? 180 : 0), axis: (0,1,0))
            .animation(.linear(duration: 1), value: card.isFaceUp)
            .foregroundColor(color)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        
    }
}

