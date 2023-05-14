import Combine
import Foundation

@MainActor
final class LocationsViewModel: ObservableObject {
    private let store: Store

    init(store: Store) {
        self.store = store
    }

    var title: String {
        "Thunderstorm"
    }

    var addLocationTitle: String {
        "Add a Location"
    }

    @Published private(set) var locationCellViewModels: [LocationCellViewModel] = []

    var addLocationViewModel: AddLocationViewModel {
        AddLocationViewModel(geocodingService: GeocodingClient(), store: store)
    }

    func start()
    {
        store.locationPublisher
            .map { $0.map(LocationCellViewModel.init(location:))}
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
