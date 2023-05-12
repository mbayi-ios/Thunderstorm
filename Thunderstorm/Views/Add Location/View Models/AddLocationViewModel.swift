import Foundation
import Combine

@MainActor
internal final class AddLocationViewModel: ObservableObject {
    private let geocodingService: GeocodingService

    private var subscripitons: Set<AnyCancellable> = []

    init(geocodingService: GeocodingService) {
        self.geocodingService = geocodingService

        setupBinding()
    }

    @Published var query = ""

    @Published private(set) var locations: [Location] = []

    var textFieldPlaceholder: String {
        "Enter the name of a city..."
    }

    var addLocationCellViewModels: [AddLocationCellViewModel] {
        locations.map(AddLocationCellViewModel.init)
    }

    func addLocation(with id: String) {
        guard let location = locations.first(where: { $0.id == id}) else {
            return
        }
    }

    private func setupBinding() {
        $query
            .throttle(for: 1.0, scheduler: RunLoop.main, latest: true)
            .filter { !$0.isEmpty }
            .sink{ [weak self] addressString in
                self?.geocodeAddressString(addressString)
            }.store(in: &subscripitons)
    }

    private func geocodeAddressString(_ addressString: String) {
        Task {
            do {
                locations = try await geocodingService.geocodeAddressString(addressString)
            } catch {
                print("unable to geocode \(addressString) \(error)")
            }
        }
    }
}
