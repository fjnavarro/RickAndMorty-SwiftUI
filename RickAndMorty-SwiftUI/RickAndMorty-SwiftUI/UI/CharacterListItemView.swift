//
//  CharacterListItemView.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 03.02.2025.
//

import SwiftUI

public struct CharacterListItemView: View {
    let character: CharacterPresentable
    var big: Bool = false
    let namespace: Namespace.ID
    
    public var body: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .matchedGeometryEffect(id: "character\(character.id)", in: namespace)
                .scaledToFill()
                .frame(width: big ? 250 : 150, height: big ? 420 : 230)
                .overlay(alignment: .bottom) {
                    if !big {
                        BottomNameView(name: character.name, id: character.id, namespace: namespace)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        }
    }
}

#Preview {
    CharacterListItemView(character: .preview, namespace: Namespace().wrappedValue)
}
