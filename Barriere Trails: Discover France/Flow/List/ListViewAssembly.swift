import SwiftUI

final class ListViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = ListView.ListRouter(navigationService: navigationService)
        let viewModel = ListView.ListViewModel(router: router)

        return ListView(viewModel: viewModel)
    }
}
