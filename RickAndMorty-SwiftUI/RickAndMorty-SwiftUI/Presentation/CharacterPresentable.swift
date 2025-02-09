//
//  CharacterPresentable.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 01.02.2025.
//

import Foundation

struct CharacterPresentable {
    let id: String
    let name: String
    let status: String
    let species: String
    let gender: String
    let imageURL: String
    
    init(domainModel: CharacterEntity) {
        self.id = "\(domainModel.id)"
        self.name = domainModel.name
        self.status = domainModel.status.rawValue
        self.species = domainModel.species
        self.gender = domainModel.gender.rawValue
        self.imageURL = domainModel.imageURL?.absoluteString ?? ""
    }
}

extension CharacterPresentable: Identifiable {
    
}

extension CharacterPresentable: Hashable {
    
}
