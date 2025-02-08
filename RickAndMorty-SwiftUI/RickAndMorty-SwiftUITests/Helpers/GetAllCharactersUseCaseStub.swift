//
//  GetAllCharactersUseCaseStub.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 08.02.2025.
//

import Foundation
@testable import RickAndMorty_SwiftUI

final class GetAllCharactersUseCaseStub: GetAllCharactersUseCaseType {
    private let result: Result<[CharacterEntity], CharacterDomainError>
    
    init(result: Result<[CharacterEntity], CharacterDomainError>) {
        self.result = result
    }
    
    func execute() async -> Result<[CharacterEntity], CharacterDomainError> {
        return result
    }
}
