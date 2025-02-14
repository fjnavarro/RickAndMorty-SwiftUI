//
//  CharacterDetailRepository.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 12.02.2025.
//

import Foundation

final class CharacterDetailRepository: CharacterDetailRepositoryType {
    private let characterDetailRemoteDataSource: CharacterDetailRemoteDataSourceType
    private let domainMapper: CharacterDomainMapper
    private let errorMapper: CharacterDomainErrorMapper
    
    init(characterDetailRemoteDataSource: CharacterDetailRemoteDataSourceType,
         domainMapper: CharacterDomainMapper,
         errorMapper: CharacterDomainErrorMapper) {
        self.characterDetailRemoteDataSource = characterDetailRemoteDataSource
        self.domainMapper = domainMapper
        self.errorMapper = errorMapper
    }
    
    func getCharacterDetail(id: String) async -> Result<CharacterEntity, CharacterDomainError> {
        // CACHE
#warning("añadir cache")
        
        let characterResult = await characterDetailRemoteDataSource.getCharacter(id: id)
        
        guard case .success(let characterDTO) = characterResult else {
            return .failure(errorMapper.map(error: characterResult.failureValue as? HTTPClientError))
        }
        
        let characterDomain = domainMapper.map(character: characterDTO)
        
        // SAVE CACHE
#warning("añadir save cache")
        
        return .success(characterDomain)
    }
}
