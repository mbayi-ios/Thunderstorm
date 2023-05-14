import Foundation

@MainActor
final class LocationCellViewModel: Identifiable, ObservableObject {

    private let location: Location

    private let weaatherService: WeatherService

    @Published private var weatherData: WeatherData?


    var locationViewModel: LocationViewModel {
        .init(location: location)
    }
    
    init(location: Location, weatherService: WeatherService) {
        self.location = location
        self.weaatherService = weatherService
    }

    var locationName: String {
        location.name
    }
    var locationCountry: String {
        location.country
    }

    private let measurementFormatter: MeasurementFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = false

        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.numberFormatter = numberFormatter

        return measurementFormatter
    }()

    var summary: String? {
        weatherData?.currently.summary
    }

    var windSpeed: String? {
        guard let windSpeed = weatherData?.currently.windSpeed else {
            return nil
        }

        let measurement = Measurement(value: Double(windSpeed), unit: UnitSpeed.milesPerHour)
        return measurementFormatter.string(from: measurement)
    }

    var temperature: String? {
        guard let temperature  = weatherData?.currently.temperature else {
            return nil
        }

        let measurement = Measurement(value: Double(temperature), unit: UnitTemperature.fahrenheit)
        return measurementFormatter.string(from: measurement)
    }

    func start() async {
        do {
            weatherData = try await weaatherService.weather(for: location)
        } catch {
            print("unable to fetch weather data for location \(error)")
        }
    }

}
