import Foundation

struct WeatherPreviewClient: WeatherService {
    func weather(for location: Location) async throws -> WeatherData {
        .preview
    }
}
