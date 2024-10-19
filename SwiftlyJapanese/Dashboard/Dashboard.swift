//
//  Dashboard.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 16/10/2024.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        @State var welcomeOpacity = 1.0
        ZStack {
            Color("SplashBackground")
            VStack {
                HStack {
                    Text("Hello, Andy!")
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.white)
                        .font(.system(size: 40, weight: .heavy))
                        .shadow(color: .green, radius: 5)
                        .shadow(color: .green, radius: 5 )
                        .opacity(welcomeOpacity)
                        .padding()
                    Spacer()
                }
                Spacer()
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 13)) {
                    welcomeOpacity = 0.0
                }
            }
        }
    }
}

#Preview {
    Dashboard()
}
