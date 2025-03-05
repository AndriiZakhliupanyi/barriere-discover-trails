import SwiftUI

extension FavoritesView {
    
    final class FavoritesRouter {
        
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
