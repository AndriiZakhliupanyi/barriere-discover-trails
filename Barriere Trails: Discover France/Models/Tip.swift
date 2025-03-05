import Foundation

struct Tip: Codable, Identifiable {
    
    var id: String { name }
    let name: String
    let description: String
}
