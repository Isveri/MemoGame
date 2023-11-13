//
//  MemoGameApp.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

@main
struct MemoGameApp: App {
    @StateObject var game = MemoGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
