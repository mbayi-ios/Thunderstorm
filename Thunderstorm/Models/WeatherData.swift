import Foundation

struct WeatherData: Decodable {

    private enum RootCodingKeys: String, CodingKey {
        case currently, daily
    }

    private enum DailyCodingKeys: String, CodingKey {
        case data
    }

    let currently: CurrentConditions
    let forecast: [DayConditions]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        currently = try container.decode(CurrentConditions.self, forKey: .currently)
        let foreCastContiner = try container.nestedContainer(keyedBy: DailyCodingKeys.self, forKey: .daily)
        forecast = try foreCastContiner.decode([DayConditions].self, forKey: .data)
    }
}


extension WeatherData {
    struct CurrentConditions: Decodable {
        let time: Date
        let icon: String
        let summary: String
        let windSpeed: Float
        let temperature: Float
    }
}

extension WeatherData {
    struct DayConditions: Decodable {
        let time: Date
        let icon: String
        let summary: String
        let windSpeed: Float
        let temperatureHigh: Float
        let temperatureLow: Float
    }
}
