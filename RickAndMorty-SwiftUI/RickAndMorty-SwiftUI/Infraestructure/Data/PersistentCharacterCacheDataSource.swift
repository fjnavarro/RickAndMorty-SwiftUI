//
//  PersistentCharacterCacheDataSource.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 15.02.2025.
//

import Foundation

final class PersistentCharacterCacheDataSource: CharacterCacheDataSourceType {
    private let container: CharacterStorageType?
    private let characterDataMapper: CharacterDataMapper
    
    init(container: CharacterStorageType?, characterDataMapper: CharacterDataMapper) {
        self.container = container
        self.characterDataMapper = characterDataMapper
    }
    
    func getCharacter(id: Int) async -> CharacterEntity? {
        guard let character = await container?.fetchCharacter(id: id, isDetailed: true) else {
            return nil
        }
        
        return characterDataMapper.map(characterData: character)
    }
    
    func saveCharacter(character: CharacterEntity) async {
        let characterData = characterDataMapper.map(characterEntity: character, isDetailed: true)
        
        if let existingCharacter = await container?.fetchCharacter(id: character.id, isDetailed: false) {
            await container?.update(characterData, existing: existingCharacter)
        } else {
            await container?.insert(characterData)
        }
    }
}
