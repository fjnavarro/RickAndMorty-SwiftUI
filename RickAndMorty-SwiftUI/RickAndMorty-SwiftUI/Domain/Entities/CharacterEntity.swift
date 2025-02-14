//
//  CharacterEntity.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 01.02.2025.
//

import Foundation

struct CharacterEntity {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String?
    let gender: CharacterGender
    let origin: LocationEntity
    let location: LocationEntity
    let imageURL: URL?
    let episodes: [String]
}

// Enum para Status
enum CharacterStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

// Enum para Gender
enum CharacterGender: String {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}
