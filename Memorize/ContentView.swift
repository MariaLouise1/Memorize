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
            ScrollView {
                cardGenerator
            }
            cardAdjustor
        }
        .padding()
    }
    
    var cardAdjustor: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
        .foregroundColor(.black)
    }
    
    var cardGenerator: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjustor(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
                Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        return cardCountAdjustor(by: -1, symbol: "folder.fill.badge.minus")
    }
    
    var cardAdder: some View {
        return cardCountAdjustor(by: +1, symbol: "folder.fill.badge.plus")
    }
}

struct CardView: View {
    let content: String
    //State is creating memory
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 10)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0 )
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


















#Preview {
    ContentView()
}
