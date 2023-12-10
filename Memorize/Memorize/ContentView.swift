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
    let emojis = ["👻", "🎃", "🕷️", "😈"]

    var body: some View {
        HStack {
            ForEach(0..<4, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false

    var body: some View {
        ZStack {
            // let means a constant
            let base = RoundedRectangle(cornerRadius: 12)

            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base
            }
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
