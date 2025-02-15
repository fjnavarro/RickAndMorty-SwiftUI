//
//  CharacterStorageType.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 15.02.2025.
//

import Foundation

protocol CharacterStorageType {
    func fetchCharacter(id: Int, isDetailed: Bool) async -> CharacterData?
    func insert(_ character: CharacterData) async
    func update(_ character: CharacterData, existing: CharacterData) async
}
