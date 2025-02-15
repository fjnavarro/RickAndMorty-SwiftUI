//
//  CharacterDataMapper.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 15.02.2025.
//

import Foundation

final class CharacterDataMapper {
    private let locationMapper: LocationDataMapper
    
    init(locationMapper: LocationDataMapper) {
        self.locationMapper = locationMapper
    }
    
    func map(characterData: CharacterData) -> CharacterEntity {
        return CharacterEntity(
            id: characterData.id,
            name: characterData.name,
            status: CharacterStatus(rawValue: characterData.status) ?? .unknown,
            species: characterData.species,
            type: characterData.type,
            gender: CharacterGender(rawValue: characterData.gender) ?? .unknown,
            origin: locationMapper.map(locationData: characterData.origin),
            location: locationMapper.map(locationData: characterData.location),
            imageURL: characterData.imageURL.flatMap { URL(string: $0) },
            episodes: characterData.episodes ?? []
        )
    }
    
    func map(characterEntity: CharacterEntity, isDetailed: Bool = false) -> CharacterData {
        return CharacterData(
            id: characterEntity.id,
            name: characterEntity.name,
            status: characterEntity.status,
            species: characterEntity.species,
            type: characterEntity.type,
            gender: characterEntity.gender,
            origin: locationMapper.map(locationEntity: characterEntity.origin),
            location: locationMapper.map(locationEntity: characterEntity.location),
            imageURL: characterEntity.imageURL,
            episodes: characterEntity.episodes,
            isDetailed: isDetailed
        )
    }
}
