//
//  CharacterListView.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 01.02.2025.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject private var viewModel: CharacterListViewModel
    
    let item = GridItem(.adaptive(minimum: 150), alignment: .center)
    
    @Namespace private var namespace
    
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            if viewModel.loading {
                VStack {
                    ProgressView()
                        .controlSize(.extraLarge)
                    
                    Text("Loading...")
                        .font(.rmLoadingText)
                        .foregroundStyle(.gray)
                        .padding(.top, 10)
                }
            } else {
                mainScroll
            }
        }
        .onAppear() {
            viewModel.onAppear()
        }
        .refreshable() {
            viewModel.refreshData()
        }
        .customAlert(message: viewModel.msg, showAlert: $viewModel.showAlert)
    }
    
    var mainScroll: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [item]) {
                    ForEach(viewModel.characters) { character in
                        CharacterListItemView(character: character,
                                              namespace: namespace,
                                              downloadImageUseCase: viewModel.downloadImageUseCase)
                    }
                }
                .padding()
            }
            .navigationTitle("Rick and Morty")
        }
    }
}

#Preview ("Light mode"){
    CharacterListView(viewModel: .preview)
        .preferredColorScheme(.light)
}

#Preview ("Dark mode"){
    CharacterListView(viewModel: .preview)
        .preferredColorScheme(.dark)
}
