import Foundation

@MainActor
final class LocationViewModel: ObservableObject {
    private let location: Location

    private let weatherService: WeatherService

    init(location: Location, weatherService: WeatherService) {
        self.location = location
        self.weatherService = weatherService
    }

    @Published private(set) var currentConditionsViewModel: CurrentConditionsViewModel?
    @Published private(set) var forecastViewModel: ForecastViewModel?

    var locationName: String {
        location.name
    }

    func start() async {
        do {
            let data = try await weatherService.weather(for: location)
            currentConditionsViewModel = .init(currently: data.currently)
            forecastViewModel = .init(forecast: data.forecast)
        } catch {
            print("unable to fetch weather data \(error)")
        }
    }
}
