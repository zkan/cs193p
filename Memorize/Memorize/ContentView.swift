//
//  ContentView.swift
//  Memorize
//
//  Created by Kan Ouivirach on 9/12/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false

    var body: some View {
        ZStack {
            // let means a constant
            let base = RoundedRectangle(cornerRadius: 12)

            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
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
