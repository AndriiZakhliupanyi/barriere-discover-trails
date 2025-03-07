import SwiftUI

extension BookingsView {
    
    final class BookingsViewModel: ObservableObject {
        
        @Published var items: [BookingInfo] = []
        
        private let router: BookingsRouter
        
        init(router: BookingsRouter) {
            self.router = router
            self.reload()
        }
        
        func openDetails(model: BookingInfo) {
            router.openDetails(model: model)
        }
        
        func reload() {
            items = Storage.shared.bookings.sorted { $0.startDate < $1.startDate }
        }
    }
}
