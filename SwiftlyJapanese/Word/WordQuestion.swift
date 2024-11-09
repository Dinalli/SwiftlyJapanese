//
//  WordQuestion.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 27/10/2024.
//

import SwiftUI

struct WordQuestion: View {
    var cards: [JapanCardData]
    @StateObject var viewModel: WordQuestionViewModel = WordQuestionViewModel()
    @Binding var currentCardIndex: Int
    @State private var card: JapanCardData!
    
    var body: some View {
        VStack {
            if card == nil {
                Text("Loading...")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .font(.system(size: 26, weight: .heavy))
                    .shadow(color: Color("JRGreenOn"), radius: 5)
                    .shadow(color: Color("JRGreenOn"), radius: 5 )
            } else {
            HStack {
                Button(action: {
                    viewModel.playEnglishWordBack()
                }, label: {
                    Text(card.english)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .font(.system(size: 26, weight: .heavy))
                        .shadow(color: Color("JRGreenOn"), radius: 5)
                        .shadow(color: Color("JRGreenOn"), radius: 5 )
                })
            }
            Divider()
            HStack {
                Button(action: {
                    viewModel.playJapaneseWordBack()
                }, label: {
                    Text(card.japanese)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .font(.system(size: 26, weight: .heavy))
                        .shadow(color: Color("JRGreenOn"), radius: 5)
                        .shadow(color: Color("JRGreenOn"), radius: 5 )
                })
            }
                HStack {
                    Button(action: {
                        viewModel.playJapaneseWordBack()
                    }, label: {
                        Text("Listen")
                    })
                    Spacer()
                    Button(action: {
                        viewModel.playJapaneseWordBack()
                    }, label: {
                        Text("Playback")
                    })
                }
            }
        }.padding()
            .task {
                if !cards.isEmpty {
                    card = cards[currentCardIndex]
                }
            }
            .onChange(of: currentCardIndex) {
                if !cards.isEmpty {
                    card = cards[currentCardIndex]
                }
            }
    }
}

//#Preview {
//    WordQuestion(currentCardIndex: .constant(0))
//}
