//
//  CharacterPresentableErrorMapper.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 03.02.2025.
//

import Foundation

final class CharacterPresentableErrorMapper {
    func map(error: CharacterDomainError?) -> String {
        switch error {
        case .generic:
            return "An unexpected error occurred. Please try again."
        case .invalidResponse:
            return "Invalid response from the server. Please check your connection."
        case .decodingFailed:
            return "Failed to process the data. Please try again later."
        case .tooManyRequests:
            return "Too many requests. Please wait and try again later."
        case .none:
            return "An unknown error occurred."
        }
    }
}
