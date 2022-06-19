//
//  CharacterView.swift
//  DungeonAndDragons
//
//  Created by chris warner on 6/19/22.
//

import SwiftUI

struct CharacterView: View {
    @StateObject var model: CharacterModel

    var body: some View {
        VStack(alignment: .leading) {
            if model.detail.count != 0 {
                Text("\(model.detail.count) spells").padding()
                List(model.detail.results) { spell in
                    NavigationLink(destination: SpellDetailView(model: SpellModel(spell: spell))) {
                        Text(spell.name)
                    }
                }
            }
            else {
                List {
                    Text("No Spells")
                }
                Spacer()
            }
        }
        .navigationTitle(model.character.name)
    }
}
