//
//  TrainlineProgressView.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 22/10/2024.
//

import SwiftUI

struct TrainlineProgressView: View {

    var stops = ["早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",
                 "早く日本",

    ]
    var currentStop = 2

    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHStack(spacing: 0) {
                ForEach(Array(stops.enumerated()), id: \.offset) { index, stop in
                    ZStack {
                        Circle()
                            .stroke(currentStop == index ? Color("JRGreenOn") : Color("JRGreen"), lineWidth:currentStop == index ? 8 : 4)
                            .frame(width: currentStop == index ? 45: 30, height: currentStop == index ? 45: 30)
                            .background(.white)
                            .clipShape(Circle())
                        Text("\(index)")
                        Text(stop)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .font(.system(size: 16, weight: .heavy))
                            .shadow(color: currentStop == index ? Color("JRGreenOn") : Color("JRGreen"), radius: 5)
                            .shadow(color: currentStop == index ? Color("JRGreenOn") : Color("JRGreen"), radius: 5 )
                            .offset(y: currentStop == index ? -40 : 30)
                    }
            if index == currentStop {
                HorizontalLine()
                    .stroke(Color("JRGreenOn"), lineWidth: 26)
                    .frame(width: 35)
                ArrowLine()
                    .fill(Color("JRGreenOn"))
                    .frame(width: 10, height: 26)

            } else {
                HorizontalLine()
                    .stroke(Color("JRGreen"), lineWidth: 26)
                    .frame(width: 45)
            }
        }
            }
        }
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
    TrainlineProgressView()
}



