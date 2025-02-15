//
//  CharacterListLoadingView.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 14.02.2025.
//

import SwiftUI

struct CharacterListLoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .controlSize(.extraLarge)
            
            Text("Loading...", comment: "Displayed while data is being fetched.")
                .font(.rmLoadingText)
                .foregroundStyle(.gray)
                .padding(.top, 10)
        }
    }
}

#Preview {
    CharacterListLoadingView()
}
