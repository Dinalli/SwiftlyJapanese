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
                Text("English word")
            }
            HStack {
                Text("Japanese word")
            }
            HStack {
                Text("Listen")
                Spacer()
                Text("Playback")
            }
        }
    }
}

#Preview {
    WordQuestion()
}
