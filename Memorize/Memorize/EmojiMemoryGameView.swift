//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Kan Ouivirach on 9/12/2566 BE.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    @State var emojis: Array<String> = []

    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            Button("New Game") {
                viewModel.createNewGame()
            }
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            HStack(spacing: 18) {
                themeSelector(name: "Halloween", symbol: "person.crop.circle.badge.moon")
                themeSelector(name: "Vehicles", symbol: "car")
                themeSelector(name: "People", symbol: "person.crop.circle")
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    func themeSelector(name: String, symbol: String) -> some View {
        Button(action: {
//            viewModel.setTheme(to: name)
        }) {
            VStack {
                Image(systemName: symbol).font(.largeTitle)
                Text(name)
            }
        }
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)]) {
            ForEach(viewModel.cards) { card in
                VStack(spacing: 0) {
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    Text(card.id)
                }
            }
        }
        .foregroundColor(viewModel.chosenTheme.color)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card

    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        ZStack {
            // let means a constant
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
//        .onTapGesture {
//            print("tapped")
//
////            isFaceUp = !isFaceUp
//            card.isFaceUp.toggle()
//        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

//def multiply(first, by second=0):
//    return first * second
//
//multiply(5, by=3)
