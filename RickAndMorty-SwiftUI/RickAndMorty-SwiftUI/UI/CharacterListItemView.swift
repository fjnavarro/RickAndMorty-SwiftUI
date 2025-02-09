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
    let downloadImageUseCase: DownloadCharacterImageUseCaseType
    
    @State private var image: UIImage?
    
    public var body: some View {
        VStack {
            if let uiImage = image {
                Image(uiImage: uiImage)
                    .characterImageStyle(width: big ? 250 : 150,
                                         height: big ? 420 : 230,
                                         namespace: namespace,
                                         characterID: character.id,
                                         characterName: character.name,
                                         showOverlay: !big)
            } else {
                Image(systemName: "photo")
                    .characterImageStyle(width: big ? 250 : 150,
                                         height: big ? 420 : 230,
                                         namespace: namespace,
                                         characterID: character.id,
                                         characterName: character.name,
                                         showOverlay: !big)
                    .task {
                        await loadImage()
                    }
            }
        }
    }
    
    private func loadImage() async {
        guard let url = URL(string: character.imageURL) else { return }
        let result = await downloadImageUseCase.execute(url: url)
        
        switch result {
        case .success(let imageData):
            if let downloadedImage = UIImage(data: imageData) {
                await MainActor.run {
                    self.image = downloadedImage
                }
            }
        case .failure(let error):
            // In the future, display and manage image errors.
            print("Image download failed with error: \(error)")
            break
        }
    }
}

#Preview {
    CharacterListItemView(character: .preview, namespace: Namespace().wrappedValue, downloadImageUseCase: DownloadCharacterImageUseCasePreview())
 }
