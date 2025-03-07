import Foundation

final class Storage {
    
    static let shared = Storage()
    private let defaults = UserDefaults.standard
    
    private init() {}
}

extension Storage {
    
    enum Key: String {
        
        case favoriteIds, bookings, email
    }
    
    var favoriteIds: [String] {
        get {
            get(for: Key.favoriteIds.rawValue) ?? []
        }
        set {
            set(newValue, for: Key.favoriteIds.rawValue)
        }
    }
    
    var bookings: [BookingInfo] {
        get {
            get(for: Key.bookings.rawValue) ?? []
        }
        set {
            set(newValue, for: Key.bookings.rawValue)
        }
    }
    
    var email: String {
        get {
            get(for: Key.email.rawValue) ?? ""
        }
        set {
            set(newValue, for: Key.email.rawValue)
        }
    }
}

private extension Storage {
    
    func set<T: Codable>(_ value: T, for key: String) {
        if let encoded = try? JSONEncoder().encode(value) {
            defaults.set(encoded, forKey: key)
        }
    }

    func get<T: Codable>(for key: String) -> T? {
        guard let data = defaults.data(forKey: key),
              let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return decoded
    }

    func remove(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
}
