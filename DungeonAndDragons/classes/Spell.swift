//
//  Spell.swift
//  DungeonAndDragons
//
//  Created by chris warner on 6/19/22.
//

import Foundation

struct Spell: Identifiable {
    var index, name, url: String

    var id: String { index }
}

extension Spell: Codable {
    enum CodingKeys: String, CodingKey {
        case index = "index"
        case name = "name"
        case url = "url"
    }
}
