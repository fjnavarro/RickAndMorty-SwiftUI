//
//  CharacterImageRepositoryType.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 09.02.2025.
//

import Foundation

protocol CharacterImageRepositoryType {
    func getImage(for url: URL) async -> Result<Data, CharacterImageError>
}
