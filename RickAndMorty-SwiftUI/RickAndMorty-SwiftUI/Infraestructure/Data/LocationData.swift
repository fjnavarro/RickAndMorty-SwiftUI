//
//  LocationData.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 05.02.2025.
//

import Foundation
import SwiftData

@Model
final class LocationData {
    var name: String
    var url: String?

    init(name: String, url: URL?) {
        self.name = name
        self.url = url?.absoluteString
    }
}
