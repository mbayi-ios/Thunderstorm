import Foundation

extension UserDefaults {
    private enum Keys {
        static let locations = "locations"
    }
    
    @objc var locations: Data? {
        get {
            data(forKey: "locations")
        }
        set {
            set(newValue, forKey: "locations")
        }
    }

    func addLocation(_ location: Location) throws {
        var locations = try decode(
            [Location].self,
            forKey: Keys.locations
        ) ?? []

        locations.append(location)

        try encode(locations, forKey: Keys.locations)
    }
}

fileprivate extension UserDefaults {
    func decode<T: Decodable>(_ type: T.Type, forKey key: String) throws -> T? {
        guard let data = data(forKey: key) else {
            return nil
        }
        return try? JSONDecoder().decode(type, from: data)
    }

    func encode<T: Encodable>(_ value: T, forKey key: String) throws {
        let data = try JSONEncoder().encode(value)
        set(data, forKey: key)
    }
}
