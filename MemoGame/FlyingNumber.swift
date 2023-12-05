//
//  FlyingNumber.swift
//  MemoGame
//
//  Created by student on 05/12/2023.
//
import Foundation
import SwiftUI

struct FlyingNumber: View {
    let number: Int
    @State var offset:CGFloat = 0

    var body: some View {
        Text(number, format: .number.sign(strategy: .always()))
            .font(.system(size: 50))
            .foregroundColor(number < 0 ? .red : .blue)
            .shadow(color: .black, radius: 1.5, x: 5, y: 5)
            .offset(y:offset)
            .onAppear{
                offset = number < 0 ? 100 : -100
            }
            .opacity(offset != 0.0 || number==0 ? 0 : 1)
            .animation(.linear(duration: 1.5))
            .onDisappear{
                offset = 0
            }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        FlyingNumber(number: 5)
    }
}
