import SwiftUI
import Foundation

struct LocationCell: View {
    var viewModel: LocationCellViewModel

    var body: some View {
        HStack {
            VStackLayout(alignment: .leading) {
                Text(viewModel.locationName)
                    .font(.title)
                    .foregroundColor(.accentColor)
                Text(viewModel.locationCountry)
                    .font(.body)
                    .foregroundColor(.gray)

                Spacer()
                if let summary = viewModel.summary {
                    Text(summary)
                }
            }
            Spacer()
            if let temperature = viewModel.temperature,
                let windSpeed = viewModel.windSpeed {
                HStack {
                    Image(systemName: "thermometer")
                        .foregroundColor(.gray)
                    Text(temperature)
                }
                HStack {
                    Image(systemName: "wind")
                        .foregroundColor(.gray)
                    Text(windSpeed)
                }
                Spacer()

            } else {
                ProgressView()
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(Color.gray)
                .opacity(0.25)
        }
    }
}


struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LocationCellViewModel(location: .preview)
        return LocationCell(viewModel: viewModel)
    }
}
