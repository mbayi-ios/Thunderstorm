//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import Foundation

struct ForecastViewModel {

    private let forecast: [WeatherData.DayConditions]

    init(forecast: [WeatherData.DayConditions]) {
        self.forecast = forecast
    }

    var forecastCellViewModels: [ForecastCellViewModel] {
        forecast.map(ForecastCellViewModel.init(dayConditions: ))
    }
}
