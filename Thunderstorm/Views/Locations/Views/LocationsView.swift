//
//  LocationsView.swift
//  Thunderstorm
//
//  Created by Amby on 11/05/2023.
//

import SwiftUI

struct LocationsView: View {

    let viewModel: LocationsViewModel

    @State private var showsAddLocationView = false

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 20.0) {
                    Button(viewModel.addLocationTitle) {
                        showsAddLocationView.toggle()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .clipShape(Capsule())
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
            .sheet(isPresented: $showsAddLocationView) {
                AddLocationView(viewModel: viewModel.addLocationViewModel, showsAddLocationView: $showsAddLocationView)
            }
        }


    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(viewModel: .init())
    }
}
