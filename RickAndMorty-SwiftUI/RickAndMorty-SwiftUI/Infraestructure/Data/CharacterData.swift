//
//  CharacterData.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 04.02.2025.
//

import Foundation
import SwiftData

@Model
class CharacterData {
    @Attribute(.unique) var id: Int
    var name: String
    var status: String
    var species: String
    var gender: String
    var origin: LocationData
    var location: LocationData
    var imageURL: String?
    var episodes: [String]?
    
    init(id: Int, name: String, status: CharacterStatus, species: String, gender: CharacterGender, origin: LocationData, location: LocationData, imageURL: URL?, episodes: [String]?) {
        self.id = id
        self.name = name
        self.status = status.rawValue
        self.species = species
        self.gender = gender.rawValue
        self.origin = origin
        self.location = location
        self.imageURL = imageURL?.absoluteString
        self.episodes = episodes
    }
}
