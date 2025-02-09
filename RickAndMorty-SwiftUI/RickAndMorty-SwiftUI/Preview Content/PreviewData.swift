//
//  PreviewData.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 01.02.2025.
//

import Foundation
import UIKit

extension CharacterListViewModel {
    static let preview = CharacterListViewModel(getAllCharactersUseCase: GetAllCharactersUseCase(repository: CharacterRepository(characterRemoteDataSource: CharacterRemoteDataSourcePreview(),
                                                                                                                                 domainMapper: CharacterDomainMapper(),
                                                                                                                                 errorMapper: CharacterDomainErrorMapper(),
                                                                                                                                 cacheDatasource: CharacterListCacheDataSourcePreview())),
                                                downloadImageUseCase: DownloadCharacterImageUseCasePreview(),
                                                errorMapper: CharacterPresentableErrorMapper())
}

extension CharacterPresentable {
    static let preview = CharacterPresentable(domainModel: .generatePreviewCharacter())
}

extension CharacterEntity {
    static func generatePreviewCharacter() -> CharacterEntity {
        return CharacterEntity(
            id: UUID().uuidString.hashValue,
            name: "Rick Sanchez",
            status: .alive,
            species: "Human",
            gender: .male,
            origin: .preview,
            location: .preview,
            imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
            episodes: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2",
                "https://rickandmortyapi.com/api/episode/3",
                "https://rickandmortyapi.com/api/episode/4",
            ]
        )
    }
}

extension LocationEntity {
    static let preview = LocationEntity(name: "Earth (C-137)",
                                        url: URL(string: "https://rickandmortyapi.com/api/location/1"))
}

extension LocationDTO {
    static let preview = LocationDTO(name: "Earth (C-137)",
                                     url: "https://rickandmortyapi.com/api/location/1")
}

final class CharacterRemoteDataSourcePreview: CharacterListRemoteDataSourceType {
    func getCharacters() async -> Result<[CharacterDTO], HTTPClientError> { .success([]) }
}

final class DownloadCharacterImageUseCasePreview: DownloadCharacterImageUseCaseType {
    func execute(url: URL) async -> Result<Data, CharacterImageError> {
        guard let image = UIImage(named: "preview_character"),
              let imageData = image.jpegData(compressionQuality: 1.0) else {
            return .failure(.unknown)
        }
        
        return .success(imageData)
    }
}

final class CharacterListCacheDataSourcePreview: CharacterListCacheDataSourceType {
    func getCharacterList() async -> [CharacterEntity] {
        [
            .generatePreviewCharacter(), .generatePreviewCharacter(),
            .generatePreviewCharacter(), .generatePreviewCharacter(),
            .generatePreviewCharacter(), .generatePreviewCharacter(),
            .generatePreviewCharacter(), .generatePreviewCharacter()
        ]
    }
    
    func saveCharacterList(_ characterList: [CharacterEntity]) async { }
}
