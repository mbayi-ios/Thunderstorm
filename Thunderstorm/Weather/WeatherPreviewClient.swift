import Foundation

struct WeatherPreviewClient: WeatherService {

    struct WeatherDataError: Error {}

    private let result: Result<WeatherData, WeatherDataError>

    init(result: Result<WeatherData, WeatherDataError> = .success(.preview)) {
        self.result = result
    }

    func weather(for location: Location) async throws -> WeatherData {
        switch result {
        case .success(let weatherData):
            return weatherData

        case .failure(let error):
            throw error
        }
    }
}
