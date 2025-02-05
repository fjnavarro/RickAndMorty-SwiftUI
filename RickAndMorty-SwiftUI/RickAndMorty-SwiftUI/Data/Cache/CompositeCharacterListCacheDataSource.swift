//
//  CompositeCharacterListCacheDataSource.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 04.02.2025.
//

import Foundation

final class CompositeCharacterListCacheDataSource: CharacterListCacheDataSourceType {
    private let temporalCache: CharacterListCacheDataSourceType
    private let pesistanceCache: CharacterListCacheDataSourceType
    
    init(temporalCache: CharacterListCacheDataSourceType, pesistanceCache: CharacterListCacheDataSourceType) {
        self.temporalCache = temporalCache
        self.pesistanceCache = pesistanceCache
    }
    
    func getCharacterList() async -> [CharacterEntity] {
        let temporalCharacterList = await temporalCache.getCharacterList()
        
        if !temporalCharacterList.isEmpty {
            return temporalCharacterList
        }
        
        let persistanceCacheList = await pesistanceCache.getCharacterList()
        await temporalCache.saveCharacterList(persistanceCacheList)
        
        return persistanceCacheList
    }
    
    func saveCharacterList(_ characterList: [CharacterEntity]) async {
        await temporalCache.saveCharacterList(characterList)
        await pesistanceCache.saveCharacterList(characterList)
    }
}
