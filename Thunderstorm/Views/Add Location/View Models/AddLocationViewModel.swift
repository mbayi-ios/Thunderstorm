import Foundation
import Combine

@MainActor
internal final class AddLocationViewModel: ObservableObject {
    private let geocodingService: GeocodingService

    private var subscripitons: Set<AnyCancellable> = []

    @Published private(set) var state: State = .empty
    @Published private var isQuerying  = false

    enum State: Equatable {
        case empty
        case querying
        case message(String)
        case results([AddLocationCellViewModel])
    }

    init(geocodingService: GeocodingService) {
        self.geocodingService = geocodingService

        setupBinding()
    }

    @Published var query = ""

    @Published private(set) var locations: [Location] = []

    var textFieldPlaceholder: String {
        "Enter the name of a city..."
    }

    func addLocation(with id: String) {
        guard let location = locations.first(where: { $0.id == id}) else {
            return
        }
        do {
            try UserDefaults.standard.addLocation(location)
        } catch {
            print("unable to add location \(error)")
        }
    }

    private func setupBinding() {
        $query
            .throttle(for: 1.0, scheduler: RunLoop.main, latest: true)
            .filter { !$0.isEmpty }
            .sink{ [weak self] addressString in
                self?.geocodeAddressString(addressString)
            }.store(in: &subscripitons)

        $locations
            .map{ $0.map(AddLocationCellViewModel.init)}
            .combineLatest($query, $isQuerying)
            .map { viewModels, query, isQuerying -> State in
                if isQuerying {
                    return .querying
                }

                if query.isEmpty {
                    return .empty
                }

                if viewModels.isEmpty {
                    return .message("no matches found ....")
                } else {
                    return .results(viewModels)
                }
            }
            .eraseToAnyPublisher()
            .removeDuplicates()
            .assign(to: &$state)
    }

    private func geocodeAddressString(_ addressString: String) {
        isQuerying = true
        Task {
            do {
                locations = try await geocodingService.geocodeAddressString(addressString)
            } catch {
                locations = []
                print("unable to geocode \(addressString) \(error)")
            }
            isQuerying = false
        }
    }
}
