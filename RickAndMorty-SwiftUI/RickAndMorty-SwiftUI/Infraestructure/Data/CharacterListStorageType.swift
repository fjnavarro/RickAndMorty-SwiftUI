//
//  CharacterListStorageType.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 04.02.2025.
//

import Foundation

protocol CharacterListStorageType {
    func fetchCharacters() async -> [CharacterData]
    func insert(_ characters: [CharacterData]) async
}
