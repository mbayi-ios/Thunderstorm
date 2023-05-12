//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import Foundation

struct ForecastViewModel {
    var forecastCellViewModels: [ForecastCellViewModel] {
        (0..<10).map { day in
            let increment = TimeInterval(day) * 24.0 * 3600.0
            let forecastDate = Date().addingTimeInterval(increment)
            return ForecastCellViewModel(forecastDate: forecastDate) }
    }
}
