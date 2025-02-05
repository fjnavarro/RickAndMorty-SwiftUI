//
//  CharacterDomainErrorMapper.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 04.02.2025.
//

import Foundation

final class CharacterDomainErrorMapper {
    func map(error: HTTPClientError?) -> CharacterDomainError {
        guard error == .tooManyRequests else {
            return .generic
        }
        
        return .tooManyRequests
    }
}
