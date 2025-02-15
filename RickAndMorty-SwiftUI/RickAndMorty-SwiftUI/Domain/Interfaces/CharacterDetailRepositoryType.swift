//
//  CharacterDetailRepositoryType.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 12.02.2025.
//

import Foundation

protocol CharacterDetailRepositoryType {
    func getCharacterDetail(id: String) async -> Result<CharacterEntity, CharacterDomainError>
}
