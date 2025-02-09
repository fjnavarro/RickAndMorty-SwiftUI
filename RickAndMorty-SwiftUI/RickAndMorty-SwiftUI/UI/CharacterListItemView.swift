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
            } else {
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
