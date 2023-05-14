import Foundation

@MainActor
final class LocationViewModel: ObservableObject {
    private let location: Location

    private let weatherService: WeatherService

    @Published private(set) var state: State = .fetching

    init(location: Location, weatherService: WeatherService) {
        self.location = location
        self.weatherService = weatherService
    }

    var locationName: String {
        location.name
    }

    enum State {
        case fetching
        case data(currentConditionsViewModel: CurrentConditionsViewModel, forecastViewModel: ForecastViewModel)
        case error(message: String)
    }

    func start() async {
        do {
            let data = try await weatherService.weather(for: location)

            state = .data(currentConditionsViewModel: .init(currently: data.currently), forecastViewModel: .init(forecast: data.forecast))
        } catch {
            print("unable to fetch weather data \(error)")
            state = .error(message: "Thurnderstorm isnt able to display weather data for \(locationName). please try again later")
        }
    }
}
