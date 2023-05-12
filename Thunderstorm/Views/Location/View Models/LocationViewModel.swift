import Foundation

struct LocationViewModel {
    private let location: Location

    init(location: Location) {
        self.location = location
    }

    var currentConditionsViewModel: CurrentConditionsViewModel {
        .init()
    }

    var forecastViewModel: ForecastViewModel {
        .init()
    }
}
