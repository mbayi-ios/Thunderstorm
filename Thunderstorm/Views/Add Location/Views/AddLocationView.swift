//
//  AddLocationView.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import SwiftUI

struct AddLocationView: View {
    @ObservedObject var viewModel: AddLocationViewModel
    var body: some View {
        VStack {
            TextField(viewModel.textFieldPlaceholder, text: $viewModel.query)
        }
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView(viewModel: .init())
    }
}
