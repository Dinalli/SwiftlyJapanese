//
//  SpeechTranslationView.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 31/10/2024.
//

import SwiftUI
import Speech

struct SpeechTranslationView: View {
    var cards: [JapanCardData]
    @StateObject var viewModel: SpeechTranslationViewModel = SpeechTranslationViewModel()
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
                Button(action: {
                    if viewModel.isRecording {
                        viewModel.stopTranscribing()
                        viewModel.isRecording = false
                    } else {
                        viewModel.startTranscribing()
                        viewModel.isRecording = true
                    }
                }, label: {
                    Image(systemName: viewModel.isRecording ? "mic" : "mic.fill")
                })
                Text(viewModel.transcript)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .heavy))
                    .shadow(color: Color("JRGreen"), radius: 3)
                    .shadow(color: Color("JRGreenOn"), radius: 5 )
                    .padding()
            }
        }.task {
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
//    SpeechTranslationView(cards: [JapanCardData(japanese: "こんにちは", english: "hello", breakdown: "Kohn-nee-chee-wah", phonetic: "konichiwa", pass: false)], currentCardIndex: .constant(0))
//}
