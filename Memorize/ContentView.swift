//
//  ContentView.swift
//  Memorize
//
//  Created by Maria Thompson on 17/07/2025.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🎃", "👻", "🕷️", "💀", "😈", "👼🏼", "🦇", "🕸️", "🥸", "👹", "🤡", "🧚🏻‍♀️"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)
        
            HStack {
                Button(action: {
                    if cardCount > 1 {
                        cardCount -= 1
                    }
                }, label: {
                        Image(systemName: "folder.fill.badge.minus")
                })
                .imageScale(.large)
                .font(.largeTitle)
                .foregroundColor(.black)
                Spacer()
                Button(action: {
                    if cardCount < emojis.count {
                        cardCount += 1
                    }
                }, label: {
                        Image(systemName: "folder.fill.badge.plus")
                })
                .imageScale(.large)
                .font(.largeTitle)
                .foregroundColor(.black)
            }
        }
        .padding()
    }
}

struct CardView: View {
    let content: String
    //State is creating memory
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 10)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


















#Preview {
    ContentView()
}
