import Foundation

struct LocationViewModel {
    private let location: Location

    init(location: Location) {
        self.location = location
    }

    var currentConditionsViewModel: CurrentConditionsViewModel {
        .init(currently: WeatherData.preview.currently)
    }

    var forecastViewModel: ForecastViewModel {
        .init(forecast: WeatherData.preview.forecast)
    }

    var locationName: String {
        location.name
    }
}
