import SwiftUI

extension TipsView {
    
    final class TipsRouter {
        
        private let navigationService: NavigationService
        
        init(navigationService: NavigationService) {
            self.navigationService = navigationService
        }
        
        func dismiss() {
            navigationService.pop()
        }
    }
}
