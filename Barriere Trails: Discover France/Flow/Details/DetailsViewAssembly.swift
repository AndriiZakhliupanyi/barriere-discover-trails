import SwiftUI

final class DetailsViewAssembly {
    
    private let place: Place
    private let navigationService: NavigationService
    
    init(place: Place, navigationService: NavigationService) {
        self.place = place
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = DetailsView.DetailsRouter(navigationService: navigationService)
        let viewModel = DetailsView.DetailsViewModel(place: place, router: router)

        return DetailsView(viewModel: viewModel)
    }
}
