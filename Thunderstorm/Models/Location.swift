//
//  Location.swift
//  Thunderstorm
//
//  Created by Amby on 11/05/2023.
//

import Foundation
import CoreLocation

struct Location: Codable, Equatable {
    let id: String
    let name: String
    let country: String

    let latitude: Double
    let longitude: Double
}


extension Location {
    static var preview: Location {
        previews[0]
    }

    static var previews: [Location] {
        [
            .init(id: "1", name: "Paris", country: "France", latitude: 48.857438, longitude: 2.29587),
            .init(id: "2", name: "New York", country: "United State", latitude: 40.3849, longitude: -40.04573),
            .init(id: "3", name: "cape Town", country: "South Africa", latitude: -33.475, longitude: 18.403098)

        ]
    }

    static var previewsData: Data {
        try! JSONEncoder().encode(Location.previews)
    }

}

extension Location {
    init?(placemark: CLPlacemark){
        guard
            let name = placemark.name,
            let country = placemark.country,
            let coordinate = placemark.location?.coordinate

        else {
            return nil
        }
        id = UUID().uuidString
        self.name = name
        self.country = country
        latitude = coordinate.latitude
        longitude = coordinate.longitude
    }
}
