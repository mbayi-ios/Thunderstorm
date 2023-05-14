import Foundation

struct CurrentConditionsViewModel {

    private let currently: WeatherData.CurrentConditions

    private let measurementFormatter = ClearSkyFormatter()

    init(currently: WeatherData.CurrentConditions) {
        self.currently = currently
    }

    var summary: String {
        currently.summary
    }

    var windSpeed: String {
        measurementFormatter.formatWindSpeed(currently.windSpeed)
    }
    var temperature: String {
        measurementFormatter.formatTemperature(currently.temperature)
    }
}
