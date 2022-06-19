//
//  SpellDetailView.swift
//  DungeonAndDragons
//
//  Created by chris warner on 6/19/22.
//

import SwiftUI

struct SpellDetailView: View {
    @StateObject var model: SpellModel

    var body: some View {
        if let spell = model.spell {
            VStack(alignment: .leading) {
                Text("Level: \(spell.level)")
                Text("range: \(spell.range)")
                Text("casting time: \(spell.castingTime)")
                Divider()
                Group {
                    Text(spell.desc.first ?? "").multilineTextAlignment(.leading)
                        .padding()
                }
                Divider()
                Spacer()
            }.padding()
            .navigationTitle(spell.index)
        }
        else {
            ProgressView()
        }
    }
}

