//
//  Foundation+Extensions.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 04.02.2025.
//

import Foundation

extension Result where Failure: Error {
    var failureValue: Error? {
        if case let .failure(error) = self {
            return error
        }
        return nil
    }
}
