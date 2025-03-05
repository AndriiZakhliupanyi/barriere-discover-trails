import SwiftUI

extension DetailsView {
    
    final class DetailsRouter {
        
        private let navigationService: NavigationService
        
        init(navigationService: NavigationService) {
            self.navigationService = navigationService
        }
        
        func dismiss() {
            navigationService.pop()
        }
    }
}
