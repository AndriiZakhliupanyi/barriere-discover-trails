import SwiftUI

final class BookingDetailsViewAssembly {
    
    private let model: BookingInfo
    private let navigationService: NavigationService
    
    init(model: BookingInfo, navigationService: NavigationService) {
        self.model = model
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = BookingDetailsView.BookingDetailsRouter(navigationService: navigationService)
        let viewModel = BookingDetailsView.BookingDetailsViewModel(model: model, router: router)

        return BookingDetailsView(viewModel: viewModel)
    }
}
