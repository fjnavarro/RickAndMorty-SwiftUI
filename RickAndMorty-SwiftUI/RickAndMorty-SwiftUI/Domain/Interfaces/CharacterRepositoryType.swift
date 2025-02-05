//
//  CharacterRepositoryType.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 01.02.2025.
//

import Foundation

protocol CharacterRepositoryType {
    func getCharacters() async -> Result<[CharacterEntity], CharacterDomainError>
}
