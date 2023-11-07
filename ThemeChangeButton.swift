//
//  CardView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ThemeChangeButton: View {
    @Binding var color: Color
    @State var icon: String
    @State var text: String

    var body: some View {
            VStack{
                Image(systemName: icon).foregroundColor(color)
                Text(text).font(.caption).foregroundColor(color)
            }
    }

}

struct ThemeChangeButton_Previews: PreviewProvider {
    static var previews: some View {
        ThemeChangeButton(color: .constant(Color.blue), icon: "smiley", text: "Motyw 1")
    }
}