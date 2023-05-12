//
//  AddLocationCell.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import SwiftUI

struct AddLocationCell: View {
    let viewModel: AddLocationCellViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.name)
                .font(.headline)
                .foregroundColor(.accentColor)
            Text(viewModel.country)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(viewModel.coordinates)
                .font(.caption)
                .foregroundColor(.gray)

        }
    }
}

struct AddLocationCell_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationCell(viewModel: .init(location: .preview))
    }
}
