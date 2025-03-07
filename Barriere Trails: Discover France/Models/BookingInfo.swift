import Foundation

struct BookingInfo: Codable, Identifiable {
    
    let id: UUID
    let place: Place
    let email: String
    let startDate: Date
    let endDate: Date
    
    init(place: Place, email: String, startDate: Date, endDate: Date) {
        self.id = .init()
        self.place = place
        self.email = email
        self.startDate = startDate
        self.endDate = endDate
    }
}
