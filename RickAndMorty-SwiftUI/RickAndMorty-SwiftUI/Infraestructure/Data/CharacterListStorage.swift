//
//  CharacterListStorage.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 05.02.2025.
//

import Foundation
import SwiftData

final class CharacterListStorage: CharacterListStorageType {
    
    static let shared = CharacterListStorage()
    
    private let container: ModelContainer
    private let context: ModelContext
    
    private init?() {
        let schema = Schema([CharacterData.self])
        
        do {
            container = try ModelContainer(for: schema, configurations: [])
            context = ModelContext(container)
        } catch {
            print("❌ Error initializing CharacterListStorage: \(error)")
            return nil
        }
    }
    
    func fetchCharacters() -> [CharacterData] {
        let descriptor = FetchDescriptor<CharacterData>()
        
        guard let characters = try? context.fetch(descriptor) else {
            return []
        }
        
        return characters
    }
    
    func insert(_ characters: [CharacterData]) async {
        characters.forEach { character in
            context.insert(character)
        }
        
        try? context.save()
    }
}
