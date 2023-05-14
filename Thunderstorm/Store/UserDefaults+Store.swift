import Combine
import Foundation

extension UserDefaults: Store {
    var locationPublisher: AnyPublisher<[Location], Never>{
        publisher(for: \.locations)
            .compactMap{$0}
            .decode(
                type: [Location].self,
                decoder: JSONDecoder()
            )
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
