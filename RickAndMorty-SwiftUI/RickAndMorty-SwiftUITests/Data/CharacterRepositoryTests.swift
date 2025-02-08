//
//  CharacterRepositoryTests.swift
//  RickAndMorty-SwiftUITests
//
//  Created by Francisco José Navarro García on 06.02.2025.
//

import XCTest
@testable import RickAndMorty_SwiftUI

final class CharacterRepositoryTests: XCTestCase {
    /// Verifies that `getCharacters` returns a success result with cached characters when the cache is not empty.
    func test_getCharacters_returns_success_when_there_is_nonEmpty_cache() async throws {
        // GIVEN
        let expectedCharacterList = CharacterEntityTestData.makeCharacterList()
        
        let (sut, _) = makeSUT(remoteDataSourceResult: .success([]),
                               cachedValue: expectedCharacterList)
        
        // WHEN
        let result = await sut.getCharacters()
        
        // THEN
        let capturedCharacters = try XCTUnwrap(result.get())
        XCTAssertEqual(capturedCharacters, expectedCharacterList)
    }
    
    /// Verifies that `getCharacters` fetches data from the API when the cache is empty and returns the mapped result.
    func test_getCharacters_returns_success_when_cache_is_empty() async throws {
        // GIVEN
        let expectedCharacterList = CharacterEntityTestData.makeCharacterList()
        
        let (sut, _) = makeSUT(remoteDataSourceResult: .success(CharacterDTOTestData.makeCharacterList()),
                               cachedValue: [])
        
        // WHEN
        let result = await sut.getCharacters()
        
        // THEN
        let capturedCharacters = try XCTUnwrap(result.get())
        XCTAssertEqual(capturedCharacters, expectedCharacterList)
    }
    
    /// Ensures that when the cache is empty and data is fetched from the API, the fetched data is saved in the cache.
    func test_getCharacters_saves_in_cache_when_cache_is_empty_and_gets_data_from_apiDataSource() async throws {
        // GIVEN
        let expectedCharacterList = CharacterEntityTestData.makeCharacterList()
        
        let (sut, cacheDataSource) = makeSUT(remoteDataSourceResult: .success(CharacterDTOTestData.makeCharacterList()),
                                             cachedValue: [])
        
        // WHEN
        _ = await sut.getCharacters()
        
        // THEN
        XCTAssertEqual(cacheDataSource.cachedCharacterList, expectedCharacterList)
    }
    
    /// Ensures that `getCharacters` returns a failure when the cache is empty and the API request fails.
    func test_getCharacters_returns_failure_when_cache_is_empty_and_apiDataSource_fails() async {
        // GIVEN
        let (sut, _) = makeSUT(remoteDataSourceResult: .failure(.clientError),
                               cachedValue: [])
        
        // WHEN
        let result = await sut.getCharacters()
        
        // THEN
        guard case .failure(let error) = result else {
            XCTFail("Expected failure, got success")
            return
        }
        
        XCTAssertEqual(error, .generic)
    }
    
    /// Ensures that when both cache and API return an empty list, the method returns an empty list successfully.
    func test_getCharacters_returns_empty_array_when_cache_is_empty_and_apiDataSource_returns_empty() async throws {
        // GIVEN
        let (sut, _) = makeSUT(remoteDataSourceResult: .success([]),
                               cachedValue: [])
        
        // WHEN
        let result = await sut.getCharacters()
        
        // THEN
        let capturedCharacters = try XCTUnwrap(result.get())
        XCTAssertEqual(capturedCharacters, [])
    }
    
    /// Ensures that when the API fails with a `tooManyRequests` error, the repository correctly maps and returns that error.
    func test_getCharacters_returns_tooManyRequests_error_when_apiDataSource_fails_with_tooManyRequests() async {
        // GIVEN
        let (sut, _) = makeSUT(remoteDataSourceResult: .failure(.tooManyRequests),
                               cachedValue: [])
        
        // WHEN
        let result = await sut.getCharacters()
        
        // THEN
        guard case .failure(let error) = result else {
            XCTFail("Expected failure, got success")
            return
        }
        
        XCTAssertEqual(error, .tooManyRequests)
    }
    
    /// Ensures that the repository handles DTOs with nil values gracefully, mapping them correctly to default values.
    func test_getCharacters_handles_nil_values_gracefully() async throws {
        // GIVEN
        let characterWithNilValues = [
            CharacterDTO(id: 1, name: "Rick", status: nil, species: nil, gender: nil, origin: nil, location: nil, image: nil, episode: nil)
        ]
        
        let expectedCharacter = CharacterEntity(
            id: 1,
            name: "Rick",
            status: .unknown,
            species: "",
            gender: .unknown,
            origin: LocationEntity(name: "Unknown", url: nil),
            location: LocationEntity(name: "Unknown", url: nil),
            imageURL: nil,
            episodes: []
        )
        
        let (sut, _) = makeSUT(remoteDataSourceResult: .success(characterWithNilValues),
                               cachedValue: [])
        
        // WHEN
        let result = await sut.getCharacters()
        
        // THEN
        let capturedCharacters = try XCTUnwrap(result.get())
        XCTAssertEqual(capturedCharacters, [expectedCharacter])
    }
}

extension CharacterRepositoryTests {
    private func makeSUT(remoteDataSourceResult: Result<[CharacterDTO], HTTPClientError>,
                         cachedValue: [CharacterEntity]) -> (sut: CharacterRepository, cache: CharacterListCacheDataSourceStub) {
        let remoteDataSource = CharacterListRemoteDataSourceStub(getCharacters: remoteDataSourceResult)
        let cacheDataSource = CharacterListCacheDataSourceStub(getCharacterList: cachedValue)
        
        let sut = CharacterRepository(characterRemoteDataSource: remoteDataSource,
                                      domainMapper: CharacterDomainMapper(),
                                      errorMapper: CharacterDomainErrorMapper(),
                                      cacheDatasource: cacheDataSource)
        
        return (sut, cacheDataSource)
    }
}
