import Foundation

protocol GeocodingService {
    func geocodeAddressString(_ addressString: String) async throws -> [Location]
}
