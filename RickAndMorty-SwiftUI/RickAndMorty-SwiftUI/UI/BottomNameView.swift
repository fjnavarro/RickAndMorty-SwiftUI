//
//  BottomNameView.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 03.02.2025.
//

import SwiftUI

struct BottomNameView: View {
    let name: String
    let id: String
    let namespace: Namespace.ID
    
    var body: some View {
        Rectangle()
            .fill(.white.opacity(0.7))
            .frame(height: 50)
            .overlay(alignment: .top) {
                VStack {
                    Text(name)
                        .font(.caption)
                        .matchedGeometryEffect(id: "name\(id)", in: namespace)
                        .foregroundStyle(.black)
                        .bold()
                        .lineLimit(2)
                        .minimumScaleFactor(0.7)
                        .multilineTextAlignment(.center)
                }
                .padding(2)
            }
    }
}

#Preview {
    BottomNameView(name: CharacterPresentable.preview.name, id: "1", namespace: Namespace().wrappedValue)
}
