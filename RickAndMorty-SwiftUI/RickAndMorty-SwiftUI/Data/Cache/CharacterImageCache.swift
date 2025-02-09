//
//  CharacterImageCache.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 09.02.2025.
//

import Foundation

final class CharacterImageCache {
    private let cache = NSCache<NSURL, NSData>()

    init(countLimit: Int = 100, totalCostLimit: Int = 50 * 1024 * 1024) {
        cache.countLimit = countLimit
        cache.totalCostLimit = totalCostLimit
    }

    func getImage(for url: URL) -> Data? {
        return cache.object(forKey: url as NSURL) as? Data
    }

    func saveImage(_ data: Data, for url: URL) {
        cache.setObject(data as NSData, forKey: url as NSURL)
    }
}
