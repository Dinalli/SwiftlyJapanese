//
//  WordQuestion.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 27/10/2024.
//

import SwiftUI

struct WordQuestion: View {
    @StateObject var viewModel: WordQuestionViewModel = WordQuestionViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    viewModel.playEnglishWordBack()
                }, label: {
                    Text("English word")
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
                    Text("ラーメン")
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
        }.padding()
    }
}

#Preview {
    WordQuestion()
}
