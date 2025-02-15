//
//  PersistentCharacterListCacheDataSourceTests.swift
//  RickAndMorty-SwiftUITests
//
//  Created by Francisco José Navarro García on 08.02.2025.
//

import XCTest
@testable import RickAndMorty_SwiftUI

final class PersistentCharacterListCacheDataSourceTests: XCTestCase {
    /// Ensures that `getCharacterList` returns an empty array when there is no cached data.
    func test_getCharacterList_returns_empty_when_storage_is_empty() async {
        // GIVEN
        let storageStub = CharacterListStorageStub(fetchCharactersResult: [])
        let sut = makeSUT(storageStub)
        
        // WHEN
        let result = await sut.getCharacterList()
        
        // THEN
        XCTAssertEqual(result, [])
    }
    
    /// Ensures that `getCharacterList` correctly maps stored `CharacterData` into `CharacterEntity`.
    func test_getCharacterList_correctly_maps_stored_data_to_entities() async {
        // GIVEN
        let storedCharacters = CharacterDataTestData.makeCharacterList()
        let expectedEntities = CharacterEntityTestData.makeCharacterList()
        
        let storageStub = CharacterListStorageStub(fetchCharactersResult: storedCharacters)
        let sut = makeSUT(storageStub)
        
        // WHEN
        let result = await sut.getCharacterList()
        
        // THEN
        XCTAssertEqual(result, expectedEntities)
    }
    
    /// Ensures that `saveCharacterList` correctly handles an empty list without errors.
    func test_saveCharacterList_saves_empty_list_in_persistent_storage() async {
        // GIVEN
        let emptyCharacterList: [CharacterEntity] = []
        let storageStub = CharacterListStorageStub(fetchCharactersResult: [])
        
        let sut = makeSUT(storageStub)
        
        // WHEN
        await sut.saveCharacterList(emptyCharacterList)
        
        // THEN
        XCTAssertEqual(storageStub.insertedCharacters, [])
    }
}

extension PersistentCharacterListCacheDataSourceTests {
    private func makeSUT(_ characterListStorage: CharacterListStorageType?) -> CharacterListCacheDataSourceType {
        let characterDataMapper = CharacterDataMapper(locationMapper: LocationDataMapper())
        return PersistentCharacterListCacheDataSource(container: characterListStorage, characterDataMapper: characterDataMapper)
    }
}
