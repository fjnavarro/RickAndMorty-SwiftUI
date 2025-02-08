//
//  CharacterListStorageStub.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 08.02.2025.
//

import Foundation
@testable import RickAndMorty_SwiftUI

final class CharacterListStorageStub: CharacterListStorageType {
    private(set) var insertedCharacters: [CharacterData] = []
    private let fetchCharactersResult: [CharacterData]
    
    init(fetchCharactersResult: [CharacterData]) {
        self.fetchCharactersResult = fetchCharactersResult
    }
    
    func fetchCharacters() async -> [CharacterData] {
        fetchCharactersResult
    }
    
    func insert(_ characters: [CharacterData]) async {
        insertedCharacters = characters
    }
}
