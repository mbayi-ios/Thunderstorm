//
//  CurrentConditionsView.swift
//  Thunderstorm
//
//  Created by Amby on 12/05/2023.
//

import SwiftUI

struct CurrentConditionsView: View {
    let viewModel: CurrentConditionsViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.temperature)
                .font(.largeTitle)

            Group {
                HStack{
                    Image(systemName: "wind")
                        .foregroundColor(.gray)
                    Text(viewModel.windSpeed)
                }
                Spacer()
                    .frame(height: 10.0)
                Text(viewModel.summary)
            }
            .font(.body)
        }
        .padding()
    }
}

struct CurrentConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentConditionsView(viewModel: .init())
    }
}
