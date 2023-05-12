//
//  ForecastCellViewModel.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import Foundation

struct ForecastCellViewModel: Identifiable {

    private let forecastDate: Date

    private let dateFormatter = DateFormatter()

    var id: UUID {
        UUID()
    }

    var lowTemperature: String{
        let temperature = Int.random(in: 50...70)
        return "\(temperature) °F"
    }

    var highTemperature: String{
        let temperature = Int.random(in: 50...90)
        return "\(temperature) °F"
    }

    init(forecastDate: Date) {
        self.forecastDate = forecastDate
    }

    var day: String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: forecastDate).capitalized
    }

    var date: String{
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter.string(from: forecastDate).capitalized
    }

    var summary: String {
        "Clear"
    }

    var imageName: String {
        "sun.max"
    }

    var windSpeed: String {
        let windSpeed = Int.random(in: 0...30)
        return "\(windSpeed) mi/h"
    }

}
