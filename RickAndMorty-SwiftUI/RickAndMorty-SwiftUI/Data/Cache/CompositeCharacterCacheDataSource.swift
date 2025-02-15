//
//  CompositeCharacterCacheDataSource.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 15.02.2025.
//

import Foundation

final class CompositeCharacterCacheDataSource: CharacterCacheDataSourceType {
    private let temporalCache: CharacterCacheDataSourceType
    private let persistanceCache: CharacterCacheDataSourceType
    
    init(temporalCache: CharacterCacheDataSourceType, persistanceCache: CharacterCacheDataSourceType) {
        self.temporalCache = temporalCache
        self.persistanceCache = persistanceCache
    }
    
    func getCharacter(id: Int) async -> CharacterEntity? {
        if let temporalCharacter = await temporalCache.getCharacter(id: id) {
            return temporalCharacter
        }
        
        guard let persistanceCache = await persistanceCache.getCharacter(id: id) else {
            return nil
        }
        
        await temporalCache.saveCharacter(character: persistanceCache)
        
        return persistanceCache
    }
    
    func saveCharacter(character: CharacterEntity) async {
        await temporalCache.saveCharacter(character: character)
        await persistanceCache.saveCharacter(character: character)
    }
}
