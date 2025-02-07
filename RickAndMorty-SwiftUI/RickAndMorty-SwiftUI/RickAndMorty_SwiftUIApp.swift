//
//  RickAndMorty_SwiftUIApp.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 31.01.2025.
//

import SwiftUI

@main
struct RickAndMorty_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(characterListView: CharacterListFactory.create())
        }
    }
}
