//
//  CharacterListFactory.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 01.02.2025.
//

import Foundation

final class CharacterListFactory {
    static func create() -> CharacterListView {
        CharacterListView(viewModel: createViewModel())
    }
    
    private static func createViewModel() -> CharacterListViewModel {
        CharacterListViewModel(getAllCharactersUseCase: createUseCase(),
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
    
    private static func createRemoteDataSource() -> RemoteDataSource {
        let httpClient = URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                              errorResolver: URLSessionErrorResolver())
        return RemoteDataSource(httpClient: httpClient)
    }
}
