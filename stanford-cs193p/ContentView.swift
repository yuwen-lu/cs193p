//
//  ContentView.swift
//  stanford-cs193p
//
//  Created by Yuwen Lu on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "💀", "😈", "🧛‍♀️", "🦄", "🦖"]
    @State var cardCount = 7;
    
    var body: some View {
        VStack {
            cards
            HStack {
                cardAdder
                Spacer()
                cardRemover
            }
            .font(.largeTitle)
        }
        .padding()
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: false)
            }
        }
    }
    
    var cardAdder: some View {
        Button(action: {
            adjustCardCount(by: 1)
        }, label: {
            Image(systemName: "rectangle.stack.fill.badge.plus")
        })
    }
    
    var cardRemover: some View {
        Button(action: {
            adjustCardCount(by: -1)
        }, label: {
            Image(systemName: "rectangle.stack.fill.badge.minus")
        })
    }
    
    func adjustCardCount(by offset: Int) {
        if (cardCount + offset > 0 && cardCount + offset < emojis.count) {
            cardCount += offset
        }
    }
}

struct CardView: View {
    let content: String
    @State var rotation = 0.0
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.orange)
                .fill(isFaceUp ? .white : .orange)
                .rotation3DEffect(
                    Angle.degrees(rotation),
                    axis: (x: 0, y: 1, z: 0)
                )
                .onTapGesture {
                    withAnimation(.linear(duration: 0.3)) {
                        rotation += 180
                        isFaceUp.toggle()
                    }
                }
            if isFaceUp {
                Text(content)
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
