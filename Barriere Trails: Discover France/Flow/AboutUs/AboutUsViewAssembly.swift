import SwiftUI

final class AboutUsViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = AboutUsView.AboutUsRouter(navigationService: navigationService)
        let viewModel = AboutUsView.AboutUsViewModel(router: router)

        return AboutUsView(viewModel: viewModel)
    }
}
