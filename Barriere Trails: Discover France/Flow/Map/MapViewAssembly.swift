import SwiftUI

final class MapViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = MapView.MapRouter(navigationService: navigationService)
        let viewModel = MapView.MapViewModel(router: router)

        return MapView(viewModel: viewModel)
    }
}
