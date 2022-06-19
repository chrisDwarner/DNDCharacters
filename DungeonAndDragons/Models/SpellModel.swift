//
//  SpellModel.swift
//  DungeonAndDragons
//
//  Created by chris warner on 6/19/22.
//

import Foundation

class SpellModel: ObservableObject {
    @Published var spell: SpellDetail?

    private var server = DndApi()

    init(spell: Spell) {
        self.server.spell(for: spell) { results in
            DispatchQueue.main.async {

                switch results {
                case .success:
                    self.spell = try! results.get()
                    print(self.spell!)
                case .failure:
                    print("failure")
                }
            }
        }
    }
}
