
import Foundation

struct LocationsViewModel {
    var title: String {
        "Thunderstorm"
    }

    var locationCellViewModels: [LocationCellViewModel] {
        Location.previews.map(LocationCellViewModel.init)
    }
}
