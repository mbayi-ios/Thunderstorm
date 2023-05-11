import SwiftUI
import Foundation

struct LocationCell: View {
    var viewModel: LocationCellViewModel

    var body: some View {
        Text("\(viewModel.locationName), \(viewModel.locationCountry)")
    }
}


struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LocationCellViewModel(location: .preview)
        return LocationCell(viewModel: viewModel)
    }
}
