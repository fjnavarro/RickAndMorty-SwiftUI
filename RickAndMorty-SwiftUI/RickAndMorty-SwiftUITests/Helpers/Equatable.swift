//
//  Equatable.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 06.02.2025.
//

import Foundation
@testable import RickAndMorty_SwiftUI

// Move these Equatable extensions to the main project if they are going to be used. Otherwise, keep them within the test files.

extension CharacterEntity: Equatable {
    public static func == (lhs: CharacterEntity, rhs: CharacterEntity) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.status == rhs.status &&
        lhs.species == rhs.species &&
        lhs.gender == rhs.gender &&
        lhs.origin == rhs.origin &&
        lhs.location == rhs.location &&
        lhs.imageURL == rhs.imageURL &&
        lhs.episodes == rhs.episodes
    }
}

extension LocationEntity: Equatable {
    public static func == (lhs: LocationEntity, rhs: LocationEntity) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
}

extension CharacterDTO: Equatable {
    public static func == (lhs: CharacterDTO, rhs: CharacterDTO) -> Bool {
        return lhs.id == rhs.id &&
               lhs.name == rhs.name &&
               lhs.status == rhs.status &&
               lhs.species == rhs.species &&
               lhs.gender == rhs.gender &&
               lhs.origin == rhs.origin &&
               lhs.location == rhs.location &&
               lhs.image == rhs.image &&
               lhs.episode == rhs.episode
    }
}

extension LocationDTO: Equatable {
    public static func == (lhs: LocationDTO, rhs: LocationDTO) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
}
