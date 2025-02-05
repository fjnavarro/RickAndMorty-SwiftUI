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
    
    @State var selected: CharacterPresentable?
    
    @Namespace private var namespace
    
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            mainScroll
                .opacity(selected == nil ? 1.0 : 0.0)
        }
        .animation(.default, value: selected)
        .onAppear() {
            viewModel.onAppear()
        }
        .refreshable() {
            viewModel.onAppear()
        }
        .customAlert(message: viewModel.msg, showAlert: $viewModel.showAlert)
    }
    
    var mainScroll: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [item]) {
                    ForEach(viewModel.characters) { character in
                        if character != selected {
                            CharacterListItemView(character: character,
                                                  namespace: namespace)
                            .onTapGesture {
                                selected = character
                            }
                        } else {
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 150, height: 230)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Rick and Morty")
        }
    }
}

#Preview {
    CharacterListView(viewModel: .preview)
}
