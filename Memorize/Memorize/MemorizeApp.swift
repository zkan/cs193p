//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Kan Ouivirach on 9/12/2566 BE.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
