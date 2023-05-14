//
//  ForecastView.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import SwiftUI

struct ForecastView: View {
    let viewModel: ForecastViewModel

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()]) {
                ForEach(viewModel.forecastCellViewModels) { viewModel in
                    ForecastCell(viewModel: viewModel)
                }
            }
            .padding()
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(viewModel: .init(forecast: WeatherData.preview.forecast))
    }
}
