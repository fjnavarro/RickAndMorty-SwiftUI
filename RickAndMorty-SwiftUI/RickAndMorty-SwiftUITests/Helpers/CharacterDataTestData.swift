//
//  CharacterDataTestData.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 08.02.2025.
//

import Foundation
@testable import RickAndMorty_SwiftUI

struct CharacterDataTestData {
    static func makeCharacterList() -> [CharacterData] {
        return [
            CharacterData(id: 1,
                          name: "Rick Sanchez",
                          status: .alive,
                          species: "Human",
                          gender: .male,
                          origin: makeLocation(),
                          location: makeLocation(),
                          imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
                          episodes: [
                            "https://rickandmortyapi.com/api/episode/1",
                            "https://rickandmortyapi.com/api/episode/2",
                            "https://rickandmortyapi.com/api/episode/3",
                            "https://rickandmortyapi.com/api/episode/4",
                          ]),
            CharacterData(
                id: 2,
                name: "Morty Smith",
                status: .alive,
                species: "Human",
                gender: .male,
                origin: makeLocation(),
                location: makeLocation(),
                imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),
                episodes: [
                    "https://rickandmortyapi.com/api/episode/1",
                    "https://rickandmortyapi.com/api/episode/2",
                    "https://rickandmortyapi.com/api/episode/3",
                    "https://rickandmortyapi.com/api/episode/4"
                ]),
            CharacterData(
                id: 3,
                name: "Summer Smith",
                status: .alive,
                species: "Human",
                gender: .female,
                origin: makeLocation(),
                location: makeLocation(),
                imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/3.jpeg"),
                episodes: [
                    "https://rickandmortyapi.com/api/episode/6",
                    "https://rickandmortyapi.com/api/episode/7",
                    "https://rickandmortyapi.com/api/episode/8",
                    "https://rickandmortyapi.com/api/episode/9",
                ]
            )
        ]
    }
    
    static func makeLocation() -> LocationData {
        return LocationData(name: "Earth (C-137)",
                            url:  URL(string: "https://rickandmortyapi.com/api/location/1"))
    }
}
