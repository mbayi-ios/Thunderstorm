//
//  ForecastCellViewModel.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import Foundation

struct ForecastCellViewModel: Identifiable {
    var id: UUID {
        UUID()
    }

    var temperature: String{
        let temperature = Int.random(in: 50...80)
        return "\(temperature) F"
    }
}
