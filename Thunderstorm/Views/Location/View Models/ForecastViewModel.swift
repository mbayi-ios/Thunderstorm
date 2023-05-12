//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import Foundation

struct ForecastViewModel {
    var forecastCellViewModels: [ForecastCellViewModel] {
        (0..<10).map { _ in ForecastCellViewModel() }
    }
}
