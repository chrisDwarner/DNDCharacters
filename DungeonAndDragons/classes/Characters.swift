//
//  Characters.swift
//  DungeonAndDragons
//
//  Created by chris warner on 6/19/22.
//

import Foundation

struct Characters: Identifiable {
    var id = UUID()
    var count = Int()
    var results = [Character]()
}

extension Characters: Codable {
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case results = "results"
    }
}

