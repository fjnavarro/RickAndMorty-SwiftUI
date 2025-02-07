//
//  CharacterRepository.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 01.02.2025.
//

import Foundation

final class CharacterRepository: CharacterRepositoryType {
    private let characterRemoteDataSource: CharacterListRemoteDataSourceType
    private let domainMapper: CharacterDomainMapper
    private let errorMapper: CharacterDomainErrorMapper
    private let cacheDatasource: CharacterListCacheDataSourceType
    
    init(characterRemoteDataSource: CharacterListRemoteDataSourceType, domainMapper: CharacterDomainMapper, errorMapper: CharacterDomainErrorMapper, cacheDatasource: CharacterListCacheDataSourceType) {
        self.characterRemoteDataSource = characterRemoteDataSource
        self.domainMapper = domainMapper
        self.errorMapper = errorMapper
        self.cacheDatasource = cacheDatasource
    }
    
    func getCharacters() async -> Result<[CharacterEntity], CharacterDomainError> {
        let charactersCache = await cacheDatasource.getCharacterList()
        
        if !charactersCache.isEmpty {
            return .success(charactersCache)
        }
        
        let charactersResult = await characterRemoteDataSource.getCharacters()
        
        guard case .success(let characters) = charactersResult else {
            return .failure(errorMapper.map(error: charactersResult.failureValue as? HTTPClientError))
        }
        
        let charactersDomain = domainMapper.map(characterList: characters)
        
        await cacheDatasource.saveCharacterList(charactersDomain)
        
        return .success(charactersDomain)
    }
}
