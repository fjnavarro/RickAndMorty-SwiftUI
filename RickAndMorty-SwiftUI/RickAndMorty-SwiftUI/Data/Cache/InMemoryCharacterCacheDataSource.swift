//
//  InMemoryCharacterCacheDataSource.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 15.02.2025.
//

actor InMemoryCharacterCacheDataSource: CharacterCacheDataSourceType {
    static let shared: InMemoryCharacterCacheDataSource = InMemoryCharacterCacheDataSource()
    
    private var cache: CharacterEntity?
    
    func getCharacter(id: Int) async -> CharacterEntity? {
        guard let cache, cache.id == id else {
            return nil
        }
        
        return cache
    }
    
    func saveCharacter(character: CharacterEntity) async {
        cache = character
    }
}
