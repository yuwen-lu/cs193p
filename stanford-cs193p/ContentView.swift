//
//  ContentView.swift
//  stanford-cs193p
//
//  Created by Yuwen Lu on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "💀", "😈", "🧛‍♀️", "🦄", "🦖"]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis.indices, id: \.self) { index in
                    CardView(content: emojis[index], isFaceUp: false)
                }
            }
            HStack {
                Button("plus.bubble.fill") {
                    
                }
            }
        }
        .padding()
    }
}

struct CardView: View {
    let content: String
    var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 10)
            if isFaceUp {
                base.stroke(Color.orange)
                base.fill(.white)
                Text(content)
            }
            else {
                base.fill(Color.orange)
            }
        }
    }
}

#Preview {
    ContentView()
}
