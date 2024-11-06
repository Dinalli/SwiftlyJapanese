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
    var english: String
    var japanese: String
    var pass: Bool
    //var cardType: CardType
    
    init(english: String, japanese: String, pass: Bool) {
        self.english = english
        self.japanese = japanese
        self.pass = pass
    }
    
    enum CodingKeys: CodingKey {
        case english
        case japanese
        case pass
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.english = try container.decode(String.self, forKey: .english)
        self.japanese = try container.decode(String.self, forKey: .japanese)
        self.pass = try container.decode(Bool.self, forKey: .pass)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(english, forKey: .english)
        try container.encode(japanese, forKey: .japanese)
        try container.encode(pass, forKey: .pass)
    }
}
