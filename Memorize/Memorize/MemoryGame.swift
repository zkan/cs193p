//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Kan Ouivirach on 24/12/2566 BE.
//

import Foundation

struct MemoryGame<CardContent> {
    // Access control
    private(set) var cards: Array<Card>

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }

    func choose(_ card: Card) {

    }

    struct Card {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
}
