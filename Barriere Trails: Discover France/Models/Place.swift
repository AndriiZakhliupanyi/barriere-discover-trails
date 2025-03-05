import Foundation
import MapKit

struct Place: Codable, Identifiable {
    
    let id: String
    let name: String
    let lat: Double
    let long: Double
    let description: String
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
}
