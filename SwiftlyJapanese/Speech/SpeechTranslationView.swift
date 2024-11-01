//
//  SpeechTranslationView.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 31/10/2024.
//

import SwiftUI
import Speech

struct SpeechTranslationView: View {
    @StateObject var viewModel: SpeechTranslationViewModel = SpeechTranslationViewModel()
    
    var body: some View {
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
}

#Preview {
    SpeechTranslationView()
}
