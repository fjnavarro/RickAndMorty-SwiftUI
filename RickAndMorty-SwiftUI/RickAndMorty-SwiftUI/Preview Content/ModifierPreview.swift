//
//  ModifierPreview.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 11.02.2025.
//

import SwiftUI

struct AlertModifierPreview: View {
    @State private var showAlert = true
    
    var body: some View {
        Text("Hello World!")
            .modifier(AlertModifier(message: "Hello, World!",
                                    showAlert: $showAlert))
    }
}
