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
            let placemarks = try await geocoder.geocodeAddressString(addressString)
            return placemarks.compactMap { placemark -> Location? in
                guard
                    let name = placemark.name,
                    let country = placemark.country,
                    let coordinate = placemark.location?.coordinate

                else {
                    return nil
                }
                return Location(id: UUID().uuidString, name: name, country: country, latitude: coordinate.latitude, longitude: coordinate.longitude)
            }
        } catch {
            print("unable to geocode address string \(error)")
            throw GeocodingError.requestFailed
        }
    }


}
