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

    var body: some View {
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
            }
    }
}

#Preview {
    Splash()
}
