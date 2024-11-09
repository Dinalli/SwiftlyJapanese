//
//  SJModel.swift
//  SwiftlyJapanese
//
//  Created by Andrew Donnelly on 05/11/2024.
//

import Foundation
import SwiftData

enum CardType {
    case word, phrase, sound, write
}

@Model
final class JapanCardData: Codable {
    var japanese: String
    var english: String
    var breakdown: String
    var phonetic: String
    var pass: Bool
    
    
    init(japanese: String, english: String, breakdown: String, phonetic: String, pass: Bool) {
        self.japanese = japanese
        self.english = english
        self.breakdown = breakdown
        self.phonetic = phonetic
        self.pass = pass
    }
    
    enum CodingKeys: CodingKey {
        case japanese
        case english
        case breakdown
        case phonetic
        case pass
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.japanese = try container.decode(String.self, forKey: .japanese)
        self.english = try container.decode(String.self, forKey: .english)
        self.breakdown = try container.decode(String.self, forKey: .breakdown)
        self.phonetic = try container.decode(String.self, forKey: .phonetic)
        self.pass = try container.decode(Bool.self, forKey: .pass)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(japanese, forKey: .japanese)
        try container.encode(english, forKey: .english)
        try container.encode(breakdown, forKey: .breakdown)
        try container.encode(phonetic, forKey: .phonetic)
        try container.encode(pass, forKey: .pass)
    }
}
