import SwiftUI

extension ListView {
    
    final class ListRouter {
        
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
