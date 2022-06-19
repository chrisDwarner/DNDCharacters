//
//  Model.swift
//  DungeonAndDragons
//
//  Created by chris warner on 6/17/22.
//

import Combine
import Foundation

class Model: ObservableObject {

    @Published var characters: Characters = Characters()

    private var server = DndApi()

    private lazy var isCharactersAvailablePublisher: AnyPublisher<Characters, Never> = {
        $characters.flatMap { characters -> AnyPublisher<Characters, Never> in
            self.server.characters
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }()

    init() {
        isCharactersAvailablePublisher.assign(to: &$characters)
    }
}
