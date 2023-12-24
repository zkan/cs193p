//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kan Ouivirach on 24/12/2566 BE.
//

import SwiftUI

class EmojiMemoryGame {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "！？"
            }
        }
    }

    private var model = createMemoryGame()

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }

    // Intent
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
