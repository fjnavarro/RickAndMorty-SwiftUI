//
//  CharacterStorage.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 15.02.2025.
//

import Foundation
import SwiftData

final class CharacterStorage: CharacterStorageType {
    static let shared = CharacterStorage()
    
    private let container: ModelContainer
    private let context: ModelContext
    
    private init?() {
        let schema = Schema([CharacterData.self])
        
        do {
            container = try ModelContainer(for: schema, configurations: [])
            context = ModelContext(container)
        } catch {
            print("❌ Error initializing CharacterStorage: \(error)")
            return nil
        }
    }
    
    func fetchCharacter(id: Int, isDetailed: Bool) async -> CharacterData? {
        let descriptor = FetchDescriptor<CharacterData>(
            predicate: #Predicate { $0.id == id && $0.isDetailed == isDetailed }
        )
        
        return try? context.fetch(descriptor).first
    }
    
    func insert(_ character: CharacterData) async {
        context.insert(character)
        
        try? context.save()
    }
    
    func update(_ character: CharacterData, existing: CharacterData) async {
        existing.name = character.name
        existing.status = character.status
        existing.species = character.species
        existing.type = character.type
        existing.gender = character.gender
        existing.origin = character.origin
        existing.location = character.location
        existing.imageURL = character.imageURL
        existing.episodes = character.episodes
        existing.isDetailed = character.isDetailed
        
        try? context.save()
    }
}
