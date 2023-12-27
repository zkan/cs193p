//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Kan Ouivirach on 24/12/2566 BE.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    // Access control
    private(set) var cards: Array<Card>
    private(set) var themes: Array<Theme>
    private(set) var chosenTheme: Theme

    var indexOfTheOneAndOnlyFaceUpCard: Int?

    init() {
        themes = [
            Theme(name: "Halloween", emojis: ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀"], numberOfPairs: 6, color: .orange),
            Theme(name: "Vehicles", emojis: ["🚙", "🚘", "🚗", "🚖", "🚔", "🛩️", "🛫", "✈️"], numberOfPairs: 8, color: .blue),
            Theme(name: "People", emojis: ["😀", "😃", "😄", "😁", "😆", "🥹", "😅", "😂"], numberOfPairs: 4, color: .yellow)
        ]

        chosenTheme = themes.randomElement()!

        cards = []
        for pairIndex in 0..<max(2, chosenTheme.numberOfPairs) {
            let content = chosenTheme.emojis[pairIndex]
            cards.append(Card(content: content as! CardContent, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content as! CardContent, id: "\(pairIndex + 1)b"))
        }
        cards.shuffle()
    }

    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                    indexOfTheOneAndOnlyFaceUpCard = nil
                } else {
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
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

    struct Theme {
        var name: String
        var emojis: Array<String>
        var numberOfPairs: Int
        var color: Color
    }
}
