//
//  ContentView.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 08/10/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [JapanCardData]

    @State var showSplash = true

    var body: some View {
        Group {
            if showSplash {
                Splash()
            } else {
                Dashboard(cards: cards)
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                showSplash = false
            }
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: JapanCardData.self, inMemory: true)
}

