//
//  Dashboard.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 16/10/2024.
//

import SwiftUI

struct Dashboard: View {
    var cards: [JapanCardData]
    @State var currentCardIndex = 0
    
    var body: some View {
        ZStack {
            Color("SplashBackground")
            VStack(spacing: 0) {
                
                    HStack {
                        Text("Hello, Andy!")
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.white)
                            .font(.system(size: 40, weight: .heavy))
                            .shadow(color: .green, radius: 5)
                            .shadow(color: .green, radius: 5 )
                            .padding()
                        Spacer()
                    }
                
                HStack {
                    TrainlineProgressView(cards: cards, currentCardIndex: $currentCardIndex)
                }.frame(height: 126)
                HStack {
                    WordQuestion(cards: cards, currentCardIndex: $currentCardIndex)
                }
                HStack {
                    SpeechTranslationView(cards: cards, currentCardIndex: $currentCardIndex)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    Dashboard(cards: [JapanCardData(japanese: "こんにちは", english: "hello", breakdown: "Kohn-nee-chee-wah", phonetic: "konichiwa", pass: false)])
}
