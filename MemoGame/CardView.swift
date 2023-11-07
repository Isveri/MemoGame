//
//  CardView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct CardView: View {
    let content: String
    let color: Color
            @State var isFaceUp : Bool = true
            var body: some View {
                ZStack{
                    let base = RoundedRectangle(cornerRadius: 24)
                    Group {
                        base.fill(Color.white)
                        base.strokeBorder(lineWidth: 2)
                        Text(content).font(.largeTitle)
                    
                }.opacity(isFaceUp ? 0 : 1)
                base.fill().opacity(isFaceUp ? 1 : 0)
                }
                .foregroundColor(color)
                .onTapGesture(perform: {isFaceUp.toggle()})
            }
}
