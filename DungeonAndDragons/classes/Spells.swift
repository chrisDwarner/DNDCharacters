//
//  Spells.swift
//  DungeonAndDragons
//
//  Created by chris warner on 6/19/22.
//

import Foundation

struct Spells: Identifiable {
    var count: Int
    var results: [Spell]
    var id = UUID()

    init(count: Int = 0, results:[Spell] = []) {
        self.count = count
        self.results = results
    }
}

extension Spells: Codable {
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case results = "results"
    }
}
