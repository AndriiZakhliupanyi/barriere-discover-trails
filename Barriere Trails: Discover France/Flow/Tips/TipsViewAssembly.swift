import SwiftUI

final class TipsViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = TipsView.TipsRouter(navigationService: navigationService)
        let viewModel = TipsView.TipsViewModel(router: router)

        return TipsView(viewModel: viewModel)
    }
}
