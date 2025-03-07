import SwiftUI

final class BookingsViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = BookingsView.BookingsRouter(navigationService: navigationService)
        let viewModel = BookingsView.BookingsViewModel(router: router)

        return BookingsView(viewModel: viewModel)
    }
}
