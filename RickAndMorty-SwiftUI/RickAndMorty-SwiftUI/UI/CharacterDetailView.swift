//
//  CharacterDetailView.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 12.02.2025.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var viewModel: CharacterDetailViewModel
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Form {
            VStack {
                CharacterImageView(character: viewModel.character,
                                   isExpanded: true,
                                   showOverlay: false,
                                   downloadImageUseCase: viewModel.downloadImageUseCase)
                Text(viewModel.character.name)
                    .font(.rmCharacterNameDetail)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            Section {
                CharacterDetailCell(title: "Status",
                                    value: viewModel.character.status)
                CharacterDetailCell(title: "Species",
                                    value: viewModel.character.species)
                CharacterDetailCell(title: "Gender",
                                    value: viewModel.character.gender)
                if let type = viewModel.character.type, !type.isEmpty {
                    CharacterDetailCell(title: "Type",
                                        value: type)
                }
            } header: {
                Text("Character Info")
                    .font(.rmSectionHeader)
            }
            
            Section {
                CharacterDetailStackCell(title: "Origin",
                                         value: viewModel.character.origin)
                CharacterDetailStackCell(title: "Current Location",
                                         value: viewModel.character.location)
            } header: {
                Text("Locations")
                    .font(.rmSectionHeader)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .customAlert(message: viewModel.msg, showAlert: $viewModel.showAlert)
    }
}

#Preview {
    CharacterDetailView(viewModel: .preview)
}
