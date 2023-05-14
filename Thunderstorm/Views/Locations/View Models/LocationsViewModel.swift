import Combine
import Foundation

@MainActor
final class LocationsViewModel: ObservableObject {
    private let store: Store

    private let weatherService: WeatherService

    init(store: Store, weatherService: WeatherService) {
        self.store = store
        self.weatherService = weatherService
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

    func start(){
        let weatherService = self.weatherService

        store.locationPublisher
            .map { locations in
                locations.map { location in
                    LocationCellViewModel(location: location, weatherService: weatherService)
                }
            }
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
