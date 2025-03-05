import SwiftUI

final class SettingsViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = SettingsView.SettingsRouter(navigationService: navigationService)
        let viewModel = SettingsView.SettingsViewModel(router: router)

        return SettingsView(viewModel: viewModel)
    }
}
