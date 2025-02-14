//
//  GetCharacterDetailUseCase.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 12.02.2025.
//

import Foundation

protocol GetCharacterDetailUseCaseType {
    func execute(id: String) async -> Result<CharacterEntity, CharacterDomainError>
}

final class GetCharacterDetailUseCase: GetCharacterDetailUseCaseType {
    private let repository: CharacterDetailRepositoryType
    
    init(repository: CharacterDetailRepositoryType) {
        self.repository = repository
    }
    
    func execute(id: String) async -> Result<CharacterEntity, CharacterDomainError> {
        return await repository.getCharacterDetail(id: id)
    }
}
