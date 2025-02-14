//
//  CharacterImageView.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 03.02.2025.
//

import SwiftUI

public struct CharacterImageView: View {
    let character: CharacterPresentable
    let isExpanded: Bool
    let showOverlay: Bool
    let downloadImageUseCase: DownloadCharacterImageUseCaseType
    
    @State private var image: UIImage?
    
    init(character: CharacterPresentable, isExpanded: Bool, showOverlay: Bool = true, downloadImageUseCase: DownloadCharacterImageUseCaseType) {
        self.character = character
        self.isExpanded = isExpanded
        self.showOverlay = showOverlay
        self.downloadImageUseCase = downloadImageUseCase
    }
    
    public var body: some View {
        VStack {
            if let uiImage = image {
                Image(uiImage: uiImage)
                    .characterImageStyle(width: isExpanded ? 250 : 150,
                                         height: isExpanded ? 420 : 230,
                                         characterName: character.name,
                                         showOverlay: showOverlay)
            } else {
                Image(systemName: "photo")
                    .characterImageStyle(width: isExpanded ? 250 : 150,
                                         height: isExpanded ? 420 : 230,
                                         characterName: character.name,
                                         showOverlay: showOverlay)
                    .task {
                        await loadImage()
                    }
            }
        }
    }
    
    private func loadImage() async {
        guard let url = character.imageURL.flatMap(URL.init) else { return }
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

#Preview("Collapsed - No Overlay") {
    CharacterImageView(character: .preview, isExpanded: false, showOverlay: false, downloadImageUseCase: DownloadCharacterImageUseCasePreview())
}

#Preview("Collapsed - With Overlay") {
    CharacterImageView(character: .preview, isExpanded: false, showOverlay: true, downloadImageUseCase: DownloadCharacterImageUseCasePreview())
}

#Preview("Expanded - No Overlay") {
    CharacterImageView(character: .preview, isExpanded: true, showOverlay: false, downloadImageUseCase: DownloadCharacterImageUseCasePreview())
}

#Preview("Expanded - With Overlay") {
    CharacterImageView(character: .preview, isExpanded: true, showOverlay: true, downloadImageUseCase: DownloadCharacterImageUseCasePreview())
}
