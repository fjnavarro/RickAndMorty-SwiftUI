//
//  InMemoryCharacterListCacheDataSource.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 04.02.2025.
//

import Foundation

actor InMemoryCharacterListCacheDataSource: CharacterListCacheDataSourceType {
    static let shared: InMemoryCharacterListCacheDataSource = InMemoryCharacterListCacheDataSource()
    
    private var cache: [CharacterEntity] = []
    
    func getCharacterList() async -> [CharacterEntity] {
        cache
    }
    
    func saveCharacterList(_ characterList: [CharacterEntity]) async {
        cache = characterList
    }
}
