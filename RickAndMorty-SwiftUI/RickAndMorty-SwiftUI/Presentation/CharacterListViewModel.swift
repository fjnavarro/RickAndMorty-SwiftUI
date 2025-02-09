//
//  CharacterListViewModel.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 01.02.2025.
//

import Foundation

final class CharacterListViewModel: ObservableObject {
    private let getAllCharactersUseCase: GetAllCharactersUseCaseType
    let downloadImageUseCase: DownloadCharacterImageUseCaseType
    private let errorMapper: CharacterPresentableErrorMapper
    
    @Published var characters: [CharacterPresentable] = []
    @Published var showAlert = false
    @Published var msg = ""
    
    init(getAllCharactersUseCase: GetAllCharactersUseCaseType, downloadImageUseCase: DownloadCharacterImageUseCaseType, errorMapper: CharacterPresentableErrorMapper) {
        self.getAllCharactersUseCase = getAllCharactersUseCase
        self.downloadImageUseCase = downloadImageUseCase
        self.errorMapper = errorMapper
    }
    
    func onAppear() {
        Task {
            let result = await getAllCharactersUseCase.execute()
            
            guard case .success(let characters) = result else {
                await handleError(error: result.failureValue as? CharacterDomainError)
                return
            }
            
            let charactersPortable = characters.map { CharacterPresentable(domainModel: $0) }
            
            await MainActor.run {
                self.characters = charactersPortable
            }
        }
    }
    
    private func handleError(error: CharacterDomainError?) async {
        await MainActor.run {
            self.showAlert = true
            self.msg = errorMapper.map(error: error)
        }
    }
}
