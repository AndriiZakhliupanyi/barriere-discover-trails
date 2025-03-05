import SwiftUI

@main
struct MainApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabBarView(
                items: [.init(title: "Places", icon: "list")],
                views: [list]
            )
            .background(Color.background)
        }
    }
    
    var list: some View {
        let navigationService = NavigationService()
        return NavigationUIController(
            rootView: ListView(viewModel: .init(router: ListView.ListRouter(navigationService: navigationService))),
            coordinator: NavigationUICoordinator(navigationService: navigationService)
        )
        .ignoresSafeArea()
    }
}
