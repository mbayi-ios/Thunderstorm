//
//  ForecastCellViewModel.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import Foundation

struct ForecastCellViewModel: Identifiable {

    private let dayConditions: WeatherData.DayConditions

    private let measurementFormatter = ClearSkyFormatter()

    private let dateFormatter = DateFormatter()

    var id: UUID {
        UUID()
    }

    init(dayConditions: WeatherData.DayConditions) {
        self.dayConditions = dayConditions
    }

    var day: String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: dayConditions.time).capitalized
    }

    var date: String{
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter.string(from: dayConditions.time).capitalized
    }

    var summary: String {
        dayConditions.summary
    }

    var windSpeed: String {
        measurementFormatter.formatWindSpeed(dayConditions.windSpeed)
    }

    var lowTemperature: String {
        measurementFormatter.formatTemperature(dayConditions.temperatureLow)
    }

    var highTemperature: String {
        measurementFormatter.formatTemperature(dayConditions.temperatureHigh)
    }
    
    var imageName: String {
        switch dayConditions.icon {
        case "clear-day":
            return "sun.max"
        case "clear-night":
            return "moon"
        case "rain":
            return "cloud.rain"
        case "sleet":
            return "cloud.sleet"
        case "wind","cloudy", "partly-couldy-day", "partly-couldy-night":
            return "cloud"
        default:
            return "sun.max"
        }
    }


}
