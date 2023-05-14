import Foundation
final class ClearSkyDecoder: JSONDecoder {
    override init() {
        super.init()

        dateDecodingStrategy = .secondsSince1970
    }
}
