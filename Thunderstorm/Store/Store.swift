import Foundation
import Combine

protocol Store {
    var locationPublisher: AnyPublisher<[Location], Never> { get }

    func addLocation(_ location: Location ) throws
}
