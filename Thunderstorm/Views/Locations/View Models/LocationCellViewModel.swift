//
//  LocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Amby on 11/05/2023.
//

import Foundation
struct LocationCellViewModel: Identifiable {
    private let location: Location

    var id: String {
        location.id
    }
    
    init(location: Location) {
        self.location = location
    }

    var locationName: String {
        location.name
    }
    var locationCountry: String {
        location.country
    }
}
