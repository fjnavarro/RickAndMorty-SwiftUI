//
//  CharacterDomainErrorMapperTests.swift
//  RickAndMorty-SwiftUITests
//
//  Created by Francisco José Navarro García on 08.02.2025.
//

import XCTest
@testable import RickAndMorty_SwiftUI

final class CharacterDomainErrorMapperTests: XCTestCase {
    /// Ensures that `map(error:)` correctly maps `.tooManyRequests` from `HTTPClientError` to `CharacterDomainError.tooManyRequests`.
    func test_map_returns_tooManyRequests_when_error_is_tooManyRequests() {
        // GIVEN
        let sut = CharacterDomainErrorMapper()
        
        // WHEN
        let mappedError = sut.map(error: .tooManyRequests)
        
        // THEN
        XCTAssertEqual(mappedError, .tooManyRequests)
    }
    
    /// Ensures that `map(error:)` returns `.generic` for any `HTTPClientError` that is **not** `.tooManyRequests`.
    func test_map_returns_generic_when_error_is_not_tooManyRequests() {
        // GIVEN
        let sut = CharacterDomainErrorMapper()
        let errorsToTest: [HTTPClientError] = [.clientError, .decodingError, .invalidURL, .responseError, .serverError, .unknownError]
        
        // WHEN & THEN
        for error in errorsToTest {
            XCTAssertEqual(sut.map(error: error), .generic, "Failed for error: \(error)")
        }
    }
    
    /// Ensures that `map(error:)` returns `.generic` when the provided error is `nil`.
    func test_map_returns_generic_when_error_is_nil() {
        // GIVEN
        let sut = CharacterDomainErrorMapper()
        
        // WHEN
        let mappedError = sut.map(error: nil)
        
        // THEN
        XCTAssertEqual(mappedError, .generic)
    }
}
