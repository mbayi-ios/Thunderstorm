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

            switch viewModel.state {
            case .empty:
                Spacer()
            case .querying:
                MessageView(style: .progressView)
            case .message(let message):
                MessageView(style: .message(message))
            case .results(let viewModels):

                List {
                    ForEach(viewModels) { cellViewModel in
                        AddLocationCell(viewModel: cellViewModel){
                            viewModel.addLocation(with: cellViewModel.id)
                            showsAddLocationView.wrappedValue.toggle()
                        }
                    }
                }
            }
        }
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AddLocationViewModel(geocodingService: GeocodingPreviewClient(), store: PreviewStore())

        AddLocationView(viewModel: viewModel, showsAddLocationView: .constant(true))
    }
}


fileprivate struct MessageView: View {
    enum Style {
        case progressView
        case message(String)
    }
    let style: Style
    var body: some View {
        VStack {
            Spacer()
            switch style {
            case .progressView:
                ProgressView()
            case .message(let message):
                Text(message)
                    .font(.body)
                    .foregroundColor(.darkGray)
            }
            Spacer()
        }
    }
}
