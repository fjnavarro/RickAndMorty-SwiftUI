//
//  GetAllCharactersUseCase.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 01.02.2025.
//

import Foundation

protocol GetAllCharactersUseCaseType {
    func execute() async -> Result<[CharacterEntity], CharacterDomainError>
}

final class GetAllCharactersUseCase: GetAllCharactersUseCaseType {
    private let repository: CharacterRepositoryType
    
    init(repository: CharacterRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[CharacterEntity], CharacterDomainError> {
        let result = await repository.getCharacters()
        
        guard let characters = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        
        return .success(characters)
    }
}
