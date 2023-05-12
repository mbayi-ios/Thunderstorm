import Foundation

struct GeocodingPreviewClient: GeocodingService {
    func geocodeAddressString(_ addressString: String) async throws -> [Location] {
        Location.previews
    }


}
