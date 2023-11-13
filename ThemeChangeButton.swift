//
//  CardView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ThemeChangeButton: View {
    @ObservedObject var viewModel : MemoGameViewModel
    var icon: String
    var text: String

    var body: some View {
        Button(action: {
            viewModel.changeTheme(theme:text)
        }
            , label:{
                VStack{
                    Image(systemName: icon).foregroundColor(viewModel.themeColor)
                    Text(text).font(.caption).foregroundColor(viewModel.themeColor)
                }
            })
    }
}
