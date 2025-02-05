//
//  PersistentCharacterListCacheDataSource.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 04.02.2025.
//

import Foundation

final class PersistentCharacterListCacheDataSource: CharacterListCacheDataSourceType {
    private let container: CharacterListStorageType?
    private let locationMapper: LocationDataMapper
    
    init(container: CharacterListStorageType?, locationMapper: LocationDataMapper) {
        self.container = container
        self.locationMapper = locationMapper
    }
    
    func getCharacterList() async -> [CharacterEntity] {
        guard let characters = await container?.fetchCharacters() else {
            return []
        }
        
        return characters.map { CharacterEntity(id: $0.id,
                                                name: $0.name,
                                                status: CharacterStatus(rawValue: $0.status) ?? .unknown,
                                                species: $0.species,
                                                gender: CharacterGender(rawValue: $0.gender) ?? .unknown,
                                                origin: locationMapper.map(locationData: $0.origin),
                                                location: locationMapper.map(locationData: $0.location),
                                                imageURL: $0.imageURL.flatMap { URL(string: $0) },
                                                episodes: $0.episodes ?? [])}
    }
    
    func saveCharacterList(_ characterList: [CharacterEntity]) async {
        let charactersData = characterList.map {
            CharacterData(id: $0.id,
                          name: $0.name,
                          status: $0.status,
                          species: $0.species,
                          gender: $0.gender,
                          origin: locationMapper.map(locationEntity: $0.origin),
                          location: locationMapper.map(locationEntity: $0.location),
                          imageURL: $0.imageURL,
                          episodes: $0.episodes)
        }
        
        await container?.insert(charactersData)
    }
}
