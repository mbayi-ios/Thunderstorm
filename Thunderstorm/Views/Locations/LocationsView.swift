//
//  LocationsView.swift
//  Thunderstorm
//
//  Created by Amby on 11/05/2023.
//

import SwiftUI

struct LocationsView: View {

    private let viewModel = LocationsViewModel()

    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle(viewModel.title)
        }


    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
