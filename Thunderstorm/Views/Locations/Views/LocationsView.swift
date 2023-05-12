//
//  LocationsView.swift
//  Thunderstorm
//
//  Created by Amby on 11/05/2023.
//

import SwiftUI

struct LocationsView: View {

    let viewModel: LocationsViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 20.0) {
                    ForEach(viewModel.locationCellViewModels) { viewModel in
                        NavigationLink {
                            LocationView(viewModel: viewModel.locationViewModel)
                        } label: {
                            LocationCell(viewModel: viewModel)
                        }

                    }
                }
                .padding()
            }
            .navigationTitle("Thunderstorm")
        }


    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(viewModel: .init())
    }
}
