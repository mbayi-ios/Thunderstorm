import CoreLocation
import Foundation

protocol Geocoder {
    func geocodeAddressString(_ addressString: String) async throws -> [CLPlacemark]
}
