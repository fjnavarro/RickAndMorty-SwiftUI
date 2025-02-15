//
//  PersistentCharacterListCacheDataSource.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 04.02.2025.
//

import Foundation

final class PersistentCharacterListCacheDataSource: CharacterListCacheDataSourceType {
    private let container: CharacterListStorageType?
    private let characterDataMapper: CharacterDataMapper
    
    init(container: CharacterListStorageType?, characterDataMapper: CharacterDataMapper) {
        self.container = container
        self.characterDataMapper = characterDataMapper
    }
    
    func getCharacterList() async -> [CharacterEntity] {
        guard let characters = await container?.fetchCharacters() else {
            return []
        }
        
        return characters.map { characterDataMapper.map(characterData: $0) }
    }
    
    func saveCharacterList(_ characterList: [CharacterEntity]) async {
        let charactersData = characterList.map {
            characterDataMapper.map(characterEntity: $0)
        }
        
        await container?.insert(charactersData)
    }
}
