//
//  CharacterDetailCell.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 14.02.2025.
//

import SwiftUI

struct CharacterDetailCell: View {
    let title: String
    var value: String?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.rmDetailTitle)
            Spacer()
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
    CharacterDetailCell(title: "title", value: "value")
        .padding()
}
