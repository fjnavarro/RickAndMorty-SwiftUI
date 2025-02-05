//
//  RemoteDataSource.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 01.02.2025.
//

import Foundation

final class RemoteDataSource {
    private let httpClient: HTTPClient
    private let baseURL: String
    
    init(httpClient: HTTPClient, baseURL: String = APIConstants.baseURL) {
        self.httpClient = httpClient
        self.baseURL = baseURL
    }
}

extension RemoteDataSource: CharacterListRemoteDataSourceType  {
    func getCharacters() async -> Result<[CharacterDTO], HTTPClientError> {
        let endpoint = Endpoint(path: "character",
                                queryParameters: [:],
                                method: .get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint,
                                                  baseUrl: baseURL)
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let characterList = try? JSONDecoder().decode(CharacterResponseDTO.self, from: data) else {
            return .failure(.decodingError)
        }
        
        return .success(characterList.results ?? [])
    }
}

private extension RemoteDataSource {
    func handleError(error: HTTPClientError?) -> HTTPClientError {
        error ?? .unknownError
    }
}
