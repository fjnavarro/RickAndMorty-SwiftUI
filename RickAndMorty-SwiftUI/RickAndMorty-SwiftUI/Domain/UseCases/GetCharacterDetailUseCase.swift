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
        let result = await repository.getCharacterDetail(id: id)
        
        guard let character = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        
        return .success(character)
    }
}
