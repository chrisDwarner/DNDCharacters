//
//  CharacterModel.swift
//  DungeonAndDragons
//
//  Created by chris warner on 6/19/22.
//

import Foundation

class CharacterModel: ObservableObject {
    @Published var character: Character
    @Published var detail = Spells()

    private var server = DndApi()

    init(character player: Character) {
        character = player

        self.server.spells(for: player) { results in
            DispatchQueue.main.async {
                self.detail = try! results.get()
                print(self.detail)
            }
        }
    }
}
