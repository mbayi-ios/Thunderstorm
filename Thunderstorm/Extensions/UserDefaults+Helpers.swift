import Foundation

extension UserDefaults {
    private enum Keys {
        static let locations = "locations"
    }
    
    @objc var locations: Data? {
        get {
            data(forKey: "locations")
        }
        set {
            set(newValue, forKey: "locations")
        }
    }
}
