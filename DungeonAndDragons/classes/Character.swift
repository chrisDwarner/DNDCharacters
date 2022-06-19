//
//  Character.swift
//  DungeonAndDragons
//
//  Created by chris warner on 6/19/22.
//

import Foundation

struct Character: Identifiable {
    var index = String()
    var name = String()
    var url = String()

    var id: String { index }
}

extension Character: Codable {
    enum CodingKeys: String, CodingKey {
        case index = "index"
        case name = "name"
        case url = "url"
    }
}
