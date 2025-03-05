import SwiftUI

extension SettingsView {
    
    final class SettingsRouter {
        
        private let navigationService: NavigationService
        
        init(navigationService: NavigationService) {
            self.navigationService = navigationService
        }
        
        func dismiss() {
            navigationService.pop()
        }
        
        func openAboutUs() {
            let view = AboutUsViewAssembly(navigationService: navigationService).view
            navigationService.push(view)
        }
    }
}
