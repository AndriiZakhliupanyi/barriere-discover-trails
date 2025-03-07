import SwiftUI

extension BookingsView {
    
    final class BookingsRouter {
        
        private let navigationService: NavigationService
        
        init(navigationService: NavigationService) {
            self.navigationService = navigationService
        }
        
        func dismiss() {
            navigationService.pop()
        }
        
        func openDetails(model: BookingInfo) {
            let view = BookingDetailsViewAssembly(model: model, navigationService: navigationService).view
            navigationService.push(view)
        }
    }
}
