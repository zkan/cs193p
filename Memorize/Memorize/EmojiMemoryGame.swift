//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kan Ouivirach on 24/12/2566 BE.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static func createMemoryGame(emojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀"]) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 6) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "!?"
            }
        }
    }

    @Published private var model = createMemoryGame()

    func setTheme(to name: String) {
        if name == "Halloween" {
            model = EmojiMemoryGame.createMemoryGame(emojis: ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀"])
        } else if name == "Vehicles" {
            model = EmojiMemoryGame.createMemoryGame(emojis: ["🚙", "🚘", "🚗", "🚖", "🚔", "🛩️", "🛫", "✈️"])
        } else if name == "People" {
            model = EmojiMemoryGame.createMemoryGame(emojis: ["😀", "😃", "😄", "😁", "😆", "🥹", "😅", "😂"])
        }
    }

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }

    // MARK: - Intents
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

    func shuffle() {
        model.shuffle()
    }
}
