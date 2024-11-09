//
//  TrainlineProgressView.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 22/10/2024.
//

import SwiftUI
import AVFoundation
import SwiftData

struct TrainlineProgressView: View {
    
    var cards: [JapanCardData]
    @Binding var currentCardIndex: Int
    
    var body: some View {
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack(spacing: 0) {
                    ForEach(Array(cards.enumerated()), id: \.element) { index, card in
                        CardProgressView(cards: cards, index: index, value: value, currentCard: card, currentCardIndex: $currentCardIndex)
                    }
                }
                .onAppear() {
                    withAnimation {
                        value.scrollTo(0)
                    }
                }
            }.scrollIndicators(.hidden)
        }
        .onAppear() {
            print(cards.count)
        }
    }
}

struct CardProgressView: View {
    var cards: [JapanCardData]
    var index: Int
    var value: ScrollViewProxy
    var currentCard: JapanCardData
    
    @Binding var currentCardIndex: Int
    @State private var player: AVAudioPlayer?
    
    var body: some View {
        ZStack {
            ZStack {
                if index == 0 {
                    Image("bullettrainback")
                        .resizable()
                        .frame(width: 80, height: 26)
                } else if index == cards.count-1 {
                    Image("bullettrainback")
                        .resizable()
                        .scaleEffect(x: -1, y: 1)
                        .frame(width: 80, height: 26)
                } else {
                    Image("carriage")
                        .resizable()
                        .frame(width: 80, height: 26)
                }
            }
            VStack {
                if index == currentCardIndex {
                    Image("ToriGate")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .offset(y: 20)
                }
                ZStack(alignment: .center) {
                    Circle()
                        .stroke(currentCardIndex == index ? Color("JRGreenOn") : Color("JRGreen"), lineWidth: currentCardIndex == index ? 8 : 4)
                        .frame(width: currentCardIndex == index ? 35: 30, height: currentCardIndex == index ? 35: 30)
                        .background(.white)
                        .clipShape(Circle())
                    Text("\(index+1)").foregroundStyle(Color.black)
                }.frame(width: currentCardIndex == index ? 35: 30, height: currentCardIndex == index ? 35: 30)
                    .offset(y: currentCardIndex == index ? -60 : 0)
            }.onTapGesture {
                withAnimation {
                    currentCardIndex = index
                    value.scrollTo(currentCard)
                    playSound()
                }
            }.frame(height: 35)
        }
    }
    
    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "Bell", withExtension: "mp3") else {
          return
        }

        do {
          player = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
          print("Failed to load the sound: \(error)")
        }
        player?.play()
      }
}

struct HorizontalLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

struct ArrowLine: InsettableShape {
    var insetAmount = 0.0

    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue}
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX+10, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }

    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
}

private func arrowTransform(lastPoint: CGPoint, previousPoint: CGPoint) -> CGAffineTransform {
        let translation = CGAffineTransform(translationX: lastPoint.x, y: lastPoint.y)
        let angle = atan2(lastPoint.y-previousPoint.y, lastPoint.x-previousPoint.x)
        let rotation = CGAffineTransform(rotationAngle: angle)
        return rotation.concatenating(translation)
    }

#Preview {
    TrainlineProgressView(cards: [JapanCardData(japanese: "こんにちは", english: "hello", breakdown: "Kohn-nee-chee-wah", phonetic: "konichiwa", pass: false)], currentCardIndex: .constant(0))
}





