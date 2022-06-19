//
//  ContentView.swift
//  DungeonAndDragons
//
//  Created by chris warner on 6/17/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = Model()
    
    var body: some View {
        NavigationView {
            List(viewModel.characters.results) { character in
                NavigationLink(destination: CharacterView(model: CharacterModel(character: character))) {
                    Text(character.name)
                }
            }
            .navigationTitle("All Classes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
