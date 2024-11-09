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
            JapanCardData.self,
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
            ContentView()
        }
        //.modelContainer(sharedModelContainer)
        .modelContainer(for: JapanCardData.self) { result in
            do {
                let container = try result.get()
                
                // Check we haven't already added our users.
                let descriptor = FetchDescriptor<JapanCardData>()
                let existingCards = try container.mainContext.fetchCount(descriptor)
                
//                // remove to persist data
//                do {
//                    try container.mainContext.delete(model: JapanCardData.self)
//                } catch {
//                    print("Failed to delete all schools.")
//                }
//                
                guard existingCards == 0 else { return }
                
                // Load and decode the JSON.
                guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
                    fatalError("Failed to find data.json")
                }
                
                let data = try Data(contentsOf: url)
                let cards = try JSONDecoder().decode([JapanCardData].self, from: data)
                
                // Add all our data to the context.
                for card in cards {
                    container.mainContext.insert(card)
                }
            } catch {
                print("Failed to pre-seed database.")
            }
        }
    }
}
