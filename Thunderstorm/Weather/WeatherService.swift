import Foundation

protocol WeatherService {
    func weather(for location: Location) async throws -> WeatherData
}

