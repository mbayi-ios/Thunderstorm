//
//  AddLocationView.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import SwiftUI

struct AddLocationView: View {
    @ObservedObject var viewModel: AddLocationViewModel

    var showsAddLocationView: Binding<Bool>

    var body: some View {
        VStack {
            TextField(viewModel.textFieldPlaceholder, text: $viewModel.query)
                .padding()

            List {
                ForEach(viewModel.addLocationCellViewModels) { cellViewModel in
                    AddLocationCell(viewModel: cellViewModel){
                        viewModel.addLocation(with: cellViewModel.id)
                        showsAddLocationView.wrappedValue.toggle()
                    }
                }
            }
        }
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView(viewModel: .init(), showsAddLocationView: .constant(true))
    }
}
