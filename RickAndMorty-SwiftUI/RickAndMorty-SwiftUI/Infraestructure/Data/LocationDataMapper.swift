//
//  LocationDataMapper.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 05.02.2025.
//

import Foundation

final class LocationDataMapper {
    func map(locationData: LocationData) -> LocationEntity {
        return LocationEntity(
            name: locationData.name,
            url: locationData.url.flatMap { URL(string: $0) }
        )
    }

    func map(locationEntity: LocationEntity) -> LocationData {
        return LocationData(
            name: locationEntity.name,
            url: locationEntity.url
        )
    }
}
