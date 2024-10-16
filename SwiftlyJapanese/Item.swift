//
//  Item.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 08/10/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
