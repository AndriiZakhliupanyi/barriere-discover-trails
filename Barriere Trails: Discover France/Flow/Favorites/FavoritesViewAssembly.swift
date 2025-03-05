import SwiftUI

final class FavoritesViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = FavoritesView.FavoritesRouter(navigationService: navigationService)
        let viewModel = FavoritesView.FavoritesViewModel(router: router)

        return FavoritesView(viewModel: viewModel)
    }
}
