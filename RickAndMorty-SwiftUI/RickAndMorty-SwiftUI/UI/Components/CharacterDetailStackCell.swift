//
//  CharacterDetailStackCell.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 14.02.2025.
//

import SwiftUI

struct CharacterDetailStackCell: View {
    let title: String
    var value: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.rmDetailTitle)
            if let value {
                Text(value)
                    .font(.rmDetailValue)
            } else {
                Text("--")
                    .font(.rmDetailValue)
            }
        }
    }
}

#Preview {
    CharacterDetailStackCell(title: "title", value: "value")
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
}
