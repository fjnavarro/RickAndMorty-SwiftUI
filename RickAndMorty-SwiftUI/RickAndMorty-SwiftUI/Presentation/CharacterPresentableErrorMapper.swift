//
//  CharacterPresentableErrorMapper.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 03.02.2025.
//

import Foundation

final class CharacterPresentableErrorMapper {
    func map(error: CharacterDomainError?) -> String {
        guard error == .tooManyRequests else {
            return "An error occurred"
        }
        
        return "Too many requests. Please try again later."
    }
}
