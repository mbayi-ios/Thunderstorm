import Combine
final class PreviewStore: Store {
    @Published private var locations = Location.previews

    var locationPublisher: AnyPublisher<[Location], Never> {
        $locations
            .eraseToAnyPublisher()
    }

    func addLocation(_ location: Location) throws {
        locations.append(location)
    }
}
