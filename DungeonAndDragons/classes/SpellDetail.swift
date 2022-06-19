//
//  SpellDetail.swift
//  DungeonAndDragons
//
//  Created by chris warner on 6/19/22.
//

import Foundation

struct SpellDetail: Codable, Identifiable {
    var id: String
    var index: String
    var name: String
    var level: Int
    var range: String
    var castingTime: String
    var desc: [String]

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case index
        case name
        case desc
        case level
        case range
        case castingTime = "casting_time"
    }
}
