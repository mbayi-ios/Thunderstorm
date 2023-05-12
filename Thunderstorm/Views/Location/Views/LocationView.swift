//
//  LocationView.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import SwiftUI

struct LocationView: View {

    let viewModel: LocationViewModel
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0.0) {
                CurrentConditionsView(viewModel: viewModel.currentConditionsViewModel)

                Divider()

                ForecastView(viewModel: viewModel.forecastViewModel)
            }
            .navigationTitle(viewModel.locationName)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationView(viewModel: .init(location: .preview))
        }

    }
}
