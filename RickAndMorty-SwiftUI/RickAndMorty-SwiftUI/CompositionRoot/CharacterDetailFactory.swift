//
//  CharacterDetailFactory.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 09.02.2025.
//

import SwiftUI

final class CharacterDetailFactory: CreateCharacterDetailView {
    func create(character: CharacterPresentable) -> CharacterDetailView {
        CharacterDetailView(viewModel: createViewModel(character: character))
    }
    
    private func createViewModel(character: CharacterPresentable) -> CharacterDetailViewModel {
        CharacterDetailViewModel(character: character,
                                 getCharacterDetailUseCase: createUseCase(),
                                 downloadImageUseCase: createDownloadImageUseCase(),
                                 errorMapper: CharacterPresentableErrorMapper())
    }
    
    private func createUseCase() -> GetCharacterDetailUseCaseType {
        GetCharacterDetailUseCase(repository: createRepository())
    }
    
    private func createRepository() -> CharacterDetailRepositoryType {
        CharacterDetailRepository(characterDetailRemoteDataSource: createCharacterDetailRemoteDataSource(),
                                  domainMapper: CharacterDomainMapper(),
                                  errorMapper: CharacterDomainErrorMapper())
    }
    
    private func createCacheDataSource() {
#warning("meter las cachés")
    }
    
    private func createPersistanceCacheDataSource() {
        
    }
    
    private func createCharacterDetailRemoteDataSource() -> CharacterDetailRemoteDataSourceType {
        CharacterDetailRemoteDataSource(httpClient: createHttpClient())
    }
    
    private func createDownloadImageUseCase() -> DownloadCharacterImageUseCaseType {
        DownloadCharacterImageUseCase(repository: createCharacterImageRepository())
    }
    
    private func createCharacterImageRepository() -> CharacterImageRepositoryType {
        CharacterImageRepository(characterImageRemoteDataSource: createCharacterImageRemoteDataSource(),
                                 cacheDataSource: CharacterImageCache(),
                                 errorMapper: CharacterImageErrorMapper())
    }
    
    private func createCharacterImageRemoteDataSource() -> CharacterImageRemoteDataSourceType {
        CharacterImageRemoteDataSource(httpClient: createHttpClient())
    }
    
    private func createHttpClient() -> HTTPClient {
        URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                             errorResolver: URLSessionErrorResolver())
    }
}
