import SwiftUI

extension BookingDetailsView {
    
    final class BookingDetailsViewModel: ObservableObject {
        
        let model: BookingInfo
        
        private let router: BookingDetailsRouter
        
        init(model: BookingInfo, router: BookingDetailsRouter) {
            self.model = model
            self.router = router
        }
        
        func openMap() {
            let url = URL(string: "http://maps.apple.com/?daddr=\(model.place.lat),\(model.place.long)")!
            UIApplication.shared.open(url)
        }
        
        func cancelBooking() {
            var bookings = Storage.shared.bookings
            bookings.removeAll { $0.id == model.id }
            Storage.shared.bookings = bookings
            router.dismiss()
        }
    }
}
