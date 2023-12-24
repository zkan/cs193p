//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Kan Ouivirach on 24/12/2566 BE.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    // Access control
    private(set) var cards: Array<Card>

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }

    mutating func choose(_ card: Card) {
        print("Choose \(card)")
        if let chosenIndex = index(of: card) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }

    // TODO: Refactor
    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    struct Card: Equatable, Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent

        var id: String
    }
}
