import Foundation

struct AddLocationCellViewModel: Identifiable {
    private let location: Location

    var id: String {
        location.id
    }

    init(location: Location) {
        self.location = location
    }

    var name: String {
        location.name
    }

    var country: String {
        location.country
    }

    var coordinates: String {
        "\(location.latitude), \(location.longitude)"
    }
}
