import Foundation

internal final class AddLocationViewModel: ObservableObject {
    @Published var query = ""

    var textFieldPlaceholder: String {
        "Enter the name of a city..."
    }
}
