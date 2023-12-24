//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Kan Ouivirach on 9/12/2566 BE.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame = EmojiMemoryGame()
    
//    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈"]
//    let emojis: [String] = ["👻", "🎃", "🕷️", "😈"]
    let emojisHalloween = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀"]
    let emojisVehicles = ["🚙", "🚘", "🚗", "🚖", "🚔", "🛩️", "🛫", "✈️"]
    let emojisPeople = ["😀", "😃", "😄", "😁", "😆", "🥹", "😅", "😂"]
    
    @State var emojis: Array<String> = []

    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            HStack(spacing: 18) {
                themeSelector(emojisTheme: emojisHalloween, name: "Halloween", symbol: "person.crop.circle.badge.moon")
                themeSelector(emojisTheme: emojisVehicles, name: "Vehicles", symbol: "car")
                themeSelector(emojisTheme: emojisPeople, name: "People", symbol: "person.crop.circle")
            }
        }
        .padding()
    }
    
    func themeSelector(emojisTheme: Array<String>, name: String, symbol: String) -> some View {
        Button(action: {
            emojis = (emojisTheme + emojisTheme).shuffled()
        }) {
            VStack {
                Image(systemName: symbol).font(.largeTitle)
                Text(name)
            }
        }
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(card: viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.red)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            // let means a constant
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content).font(.largeTitle)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
//        .onTapGesture {
//            print("tapped")
//
////            isFaceUp = !isFaceUp
//            card.isFaceUp.toggle()
//        }
    }
}

#Preview {
    EmojiMemoryGameView()
}

//def multiply(first, by second=0):
//    return first * second
//
//multiply(5, by=3)
