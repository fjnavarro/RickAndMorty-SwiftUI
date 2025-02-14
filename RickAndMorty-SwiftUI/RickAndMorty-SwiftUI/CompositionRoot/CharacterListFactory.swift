//
//  CharacterListFactory.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 01.02.2025.
//

import Foundation

final class CharacterListFactory {
    static func create() -> CharacterListView {
        CharacterListView(viewModel: createViewModel(),
                          createCharacterDetailView: CharacterDetailFactory())
    }
    
    private static func createViewModel() -> CharacterListViewModel {
        CharacterListViewModel(getAllCharactersUseCase: createUseCase(),
                               downloadImageUseCase: createDownloadImageUseCase(),
                               errorMapper: CharacterPresentableErrorMapper())
    }
    
    private static func createUseCase() -> GetAllCharactersUseCaseType {
        GetAllCharactersUseCase(repository: createRepository())
    }
    
    private static func createRepository() -> CharacterRepositoryType {
        CharacterRepository(characterRemoteDataSource: createRemoteDataSource(),
                            domainMapper: CharacterDomainMapper(),
                            errorMapper: CharacterDomainErrorMapper(),
                            cacheDatasource: createCacheDataSource())
    }
    
    private static func createCacheDataSource() -> CharacterListCacheDataSourceType {
        CompositeCharacterListCacheDataSource(temporalCache: InMemoryCharacterListCacheDataSource.shared,
                                              pesistanceCache: createPersistanceCacheDataSource())
    }
    
    private static func createPersistanceCacheDataSource() -> CharacterListCacheDataSourceType {
        PersistentCharacterListCacheDataSource(container: CharacterListStorage.shared,
                                               locationMapper: LocationDataMapper())
    }
    
    private static func createRemoteDataSource() -> CharacterListRemoteDataSourceType {
        RemoteDataSource(httpClient: createHttpClient())
    }
    
    private static func createDownloadImageUseCase() -> DownloadCharacterImageUseCaseType {
        DownloadCharacterImageUseCase(repository: createCharacterImageRepository())
    }
    
    private static func createCharacterImageRepository() -> CharacterImageRepositoryType {
        CharacterImageRepository(characterImageRemoteDataSource: createCharacterImageRemoteDataSource(),
                                 cacheDataSource: CharacterImageCache(),
                                 errorMapper: CharacterImageErrorMapper())
    }
    
    private static func createCharacterImageRemoteDataSource() -> CharacterImageRemoteDataSourceType {
        CharacterImageRemoteDataSource(httpClient: createHttpClient())
    }
    
    private static func createHttpClient() -> HTTPClient {
        URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                             errorResolver: URLSessionErrorResolver())
    }
}
