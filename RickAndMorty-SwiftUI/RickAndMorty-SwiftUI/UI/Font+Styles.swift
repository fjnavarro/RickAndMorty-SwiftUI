//
//  Font+Styles.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 11.02.2025.
//

import SwiftUI

extension Font {
    static let rmCharacterName = Font.system(.caption, design: .rounded)
        .weight(.bold)
    
    static let rmLoadingText = Font.system(.headline, design: .rounded)
        .weight(.semibold)
    
    static let rmAlertTitle = Font.system(.title3, design: .rounded)
        .weight(.bold)
    
    static let rmAlertButton = Font.system(.body, design: .rounded)
        .weight(.semibold)
}
