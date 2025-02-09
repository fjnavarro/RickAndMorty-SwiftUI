//
//  CharacterImageRepository.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 08.02.2025.
//

import Foundation

final class CharacterImageRepository: CharacterImageRepositoryType {
    private let characterImageRemoteDataSource: CharacterImageRemoteDataSourceType
    private let characterImageCache: CharacterImageCache
    private let errorMapper: CharacterImageErrorMapper
    
    init(characterImageRemoteDataSource: CharacterImageRemoteDataSourceType, cacheDataSource: CharacterImageCache, errorMapper: CharacterImageErrorMapper) {
        self.characterImageRemoteDataSource = characterImageRemoteDataSource
        self.characterImageCache = cacheDataSource
        self.errorMapper = errorMapper
    }
    
    func getImage(for url: URL) async -> Result<Data, CharacterImageError> {
        if let cachedData = characterImageCache.getImage(for: url) {
            return .success(cachedData)
        }
        
        let characterImageResult = await characterImageRemoteDataSource.downloadImage(from: url)
        
        guard case .success(let characterImage) = characterImageResult else {
            return .failure(errorMapper.map(error: characterImageResult.failureValue as? HTTPClientError))
        }

        characterImageCache.saveImage(characterImage, for: url)
        
        return .success(characterImage)
    }
}
