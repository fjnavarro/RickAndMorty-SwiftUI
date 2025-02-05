//
//  View+Modifiers.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 03.02.2025.
//

import SwiftUI

extension View {
    func customAlert(message: String, showAlert: Binding<Bool>) -> some View {
        modifier(AlertModifier(message: message, showAlert: showAlert))
    }
}
