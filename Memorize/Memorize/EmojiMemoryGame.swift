//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kan Ouivirach on 24/12/2566 BE.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame()
    }

    @Published private var model = createMemoryGame()

    func createNewGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }

    var chosenTheme: MemoryGame<String>.Theme {
        return model.chosenTheme
    }

    // MARK: - Intents
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

    func shuffle() {
        model.shuffle()
    }
}
