import SwiftUI

extension BookingDetailsView {
    
    final class BookingDetailsRouter {
        
        private let navigationService: NavigationService
        
        init(navigationService: NavigationService) {
            self.navigationService = navigationService
        }
        
        func dismiss() {
            navigationService.pop()
        }
        
        func openDetails(place: Place) {
            let view = DetailsViewAssembly(place: place, navigationService: navigationService).view
            navigationService.push(view)
        }
    }
}
