//
//  WordQuestionViewModel.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 27/10/2024.
//

import Foundation
import Speech
import Translation
import AVFoundation

public class WordQuestionViewModel: ObservableObject {
    @Published var englishWord = "Ramen"
    @Published var japaneseWord = "ラーメン"
    
    func playEnglishWordBack() {
        let utterance = AVSpeechUtterance(string: englishWord)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.1

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func playJapaneseWordBack() {
        let utterance = AVSpeechUtterance(string: japaneseWord)
        utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.siri_female_ja-JP_compact")
        //utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        utterance.rate = 0.1

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}
