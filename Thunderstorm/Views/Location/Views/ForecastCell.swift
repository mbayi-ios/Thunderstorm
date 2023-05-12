//
//  ForecastCell.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import SwiftUI

struct ForecastCell: View {
    let viewModel: ForecastCellViewModel

    var body: some View {
        Text(viewModel.temperature)
    }
}

struct ForecastCell_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCell(viewModel: .init())
    }
}
