//
//  Splash.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 16/10/2024.
//

import SwiftUI

struct Splash: View {
    @State var sunOffset = 40.0
    @State var leftCloudOffset = -40.0
    @State var rightCloudOffset = 40.0
    @State var titleText = "Swiftly Japanese"
    @State var shadowColor: Color = .green

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color("SplashBackground")
                Image("smallcloud").resizable()
                    .frame(width: 144,height: 144)
                    .offset(y:sunOffset)
                Image("sunlight").resizable()
                    .frame(width: 144,height: 144)
                    .offset(y:sunOffset)
                Image("Fuji").resizable()
                    .frame(width: 144,height: 144)
                Image("leftcloud").resizable()
                    .frame(width: 144,height: 144)
                    .offset(x:leftCloudOffset)
                Image("rightcloud").resizable()
                    .frame(width: 144,height: 144)
                    .offset(x:rightCloudOffset)
                VStack {
                    Text(titleText)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .font(.system(size: 50, weight: .heavy))
                        .frame(width: 250)
                        .shadow(color: shadowColor, radius: 5)
                        .shadow(color: shadowColor, radius: 5 )
                        .position(x: geo.size.width/2, y: geo.size.height/3)
                }
            }.ignoresSafeArea(.all)
                .onAppear {
                    withAnimation(.easeInOut(duration: 3)) {
                        sunOffset = 0
                    }
                    withAnimation(.easeInOut(duration: 3)) {
                        leftCloudOffset = 0
                    }
                    withAnimation(.easeInOut(duration: 3)) {
                        rightCloudOffset = 0
                    }
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                        titleText = "素早く日本語化"
                        shadowColor = .red
                    }

                }
       }
    }
}

#Preview {
    Splash()
}
