//
//  WordQuestionViewModel.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 27/10/2024.
//

import Foundation
import Speech
import Translation

public class WordQuestionViewModel: ObservableObject {
    @Published var englishWord = "Ramen"
    @Published var japaneseWord = ""
    
    func playWordBack() {
        let utterance = AVSpeechUtterance(string: japaneseWord)

        synthesizer.speak(utterance)

        }
    }
}
