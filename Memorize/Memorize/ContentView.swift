//
//  ContentView.swift
//  Memorize
//
//  Created by Kan Ouivirach on 9/12/2566 BE.
//

import SwiftUI

struct ContentView: View {
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
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.red)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false

    var body: some View {
        ZStack {
            // let means a constant
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            print("tapped")

//            isFaceUp = !isFaceUp
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

//def multiply(first, by second=0):
//    return first * second
//
//multiply(5, by=3)
