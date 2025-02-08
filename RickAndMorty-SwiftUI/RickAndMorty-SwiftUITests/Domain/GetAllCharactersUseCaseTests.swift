//
//  GetAllCharactersUseCaseTests.swift
//  RickAndMorty-SwiftUITests
//
//  Created by Francisco José Navarro García on 06.02.2025.
//

import XCTest
@testable import RickAndMorty_SwiftUI

final class GetAllCharactersUseCaseTests: XCTestCase {
    /// Ensures that `execute` returns a non-empty array when the repository provides valid data.
    func test_execute_succeeds_when_repository_returns_nonEmpty_array() async throws {
        // GIVEN
        let mockCharacterList = CharacterEntityTestData.makeCharacterList()
        let repositoryStub = CharacterRepositoryStub(result: .success(mockCharacterList))
        let sut = GetAllCharactersUseCase(repository: repositoryStub)
        
        // WHEN
        let capturedResult = await sut.execute()
        
        // THEN
        let capturedCharacters = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedCharacters, mockCharacterList)
    }
    
    /// Ensures that `execute` returns an empty array when the repository provides an empty array.
    func test_execute_succeeds_when_repository_returns_empty_array() async throws {
        // GIVEN
        let repositoryStub = CharacterRepositoryStub(result: .success([]))
        let sut = GetAllCharactersUseCase(repository: repositoryStub)
        
        // WHEN
        let capturedResult = await sut.execute()
        
        // THEN
        let capturedCharacters = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedCharacters, [])
    }
    
    /// Ensures that `execute` returns a generic error when the repository fails.
    func test_execute_returns_error_when_repository_returns_failure() async {
        // GIVEN
        let repositoryStub = CharacterRepositoryStub(result: .failure(.generic))
        let sut = GetAllCharactersUseCase(repository: repositoryStub)
        
        // WHEN
        let capturedResult = await sut.execute()
        
        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }
        
        XCTAssertEqual(error, .generic)
    }
    
    /// Ensures that `execute` returns an `invalidResponse` error when the repository fails with an invalid response.
    func test_execute_returns_invalidResponse_error_when_repository_fails_with_invalidResponse() async {
        // GIVEN
        let repositoryStub = CharacterRepositoryStub(result: .failure(.invalidResponse))
        let sut = GetAllCharactersUseCase(repository: repositoryStub)

        // WHEN
        let capturedResult = await sut.execute()

        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .invalidResponse)
    }
    
    /// Ensures that `execute` returns a `tooManyRequests` error when the repository fails due to rate limiting.
    func test_execute_returns_generic_error_when_repository_fails_with_unexpected_error() async {
        // GIVEN
        let repositoryStub = CharacterRepositoryStub(result: .failure(.tooManyRequests))
        let sut = GetAllCharactersUseCase(repository: repositoryStub)

        // WHEN
        let capturedResult = await sut.execute()

        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .tooManyRequests)
    }
    
    /// Ensures that `execute` returns a `decodingFailed` error when the repository fails due to decoding issues.
    func test_execute_returns_decodingFailed_when_repository_fails_with_decodingError() async {
        // GIVEN
        let repositoryStub = CharacterRepositoryStub(result: .failure(.decodingFailed))
        let sut = GetAllCharactersUseCase(repository: repositoryStub)

        // WHEN
        let capturedResult = await sut.execute()

        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .decodingFailed)
    }
}
