import Foundation
import CoreLocation

final class GeocodingClient: GeocodingService {
    enum GeocodingError: Error {
        case invalidAddressString
        case requestFailed
    }

    private let geocoder = CLGeocoder()

    func geocodeAddressString(_ addressString: String) async throws -> [Location] {
        guard !addressString.isEmpty else {
            throw GeocodingError.invalidAddressString
        }
        do {
            return try await geocoder
                .geocodeAddressString(addressString)
                .compactMap(Location.init(placemark:))
        } catch {
            print("unable to geocode address string \(error)")
            throw GeocodingError.requestFailed
        }
    }


}
