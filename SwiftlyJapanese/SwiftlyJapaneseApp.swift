//
//  SwiftlyJapaneseApp.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 08/10/2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftlyJapaneseApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            Splash()
        }
        .modelContainer(sharedModelContainer)
    }
}
