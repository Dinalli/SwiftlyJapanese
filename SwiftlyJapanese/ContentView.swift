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
    @Query private var items: [Item]

    @State var showSplash = true

    var body: some View {
        Group {
        if showSplash {
            Splash()
        } else {
            Dashboard()
        }
//            NavigationSplitView {
//                List {
//                    ForEach(items) { item in
//                        NavigationLink {
//                            Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                        } label: {
//                            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                        }
//                    }
//                    .onDelete(perform: deleteItems)
//                }
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        EditButton()
//                    }
//                    ToolbarItem {
//                        Button(action: addItem) {
//                            Label("Add Item", systemImage: "plus")
//                        }
//                    }
//                }
//            } detail: {
//                Text("Select an item")
//            }
//        }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                showSplash = false
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

