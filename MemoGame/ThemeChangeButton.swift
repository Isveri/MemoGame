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
                Image(systemName: symbol)
                Text(text).font(.title3)
            }
    }

}

struct ThemeChangeButton_Previews: PreviewProvider {
    static var previews: some View {
        SectionButton(color: .constant(.blue), icon: "face.smiling", text: "Motyw 1")
    }
}