import SwiftUI

@main
struct MainApp: App {
    
    init() {
        SoundService.shared.startAudio()
    }
    
    var body: some Scene {
        WindowGroup {
            TabBarView(
                items: [
                    .init(title: "Places", icon: "list", view: AnyView(list)),
                    .init(title: "Map", icon: "map", view: AnyView(map)),
                    .init(title: "Bookings", icon: "bookings", view: AnyView(bookings)),
                    .init(title: "Travel tips", icon: "tips", view: AnyView(tips)),
                    .init(title: "Settings", icon: "settings", view: AnyView(settings)),
                ]
            )
            .background(Color.background)
            .fullScreenAutoLoader()
        }
    }
    
    var list: some View {
        let navigationService = NavigationService()
        return NavigationUIController(
            rootView: ListViewAssembly(navigationService: navigationService).view,
            coordinator: NavigationUICoordinator(navigationService: navigationService)
        )
        .ignoresSafeArea()
    }
    
    var map: some View {
        let navigationService = NavigationService()
        return NavigationUIController(
            rootView: MapViewAssembly(navigationService: navigationService).view,
            coordinator: NavigationUICoordinator(navigationService: navigationService)
        )
        .ignoresSafeArea()
    }
    
    var bookings: some View {
        let navigationService = NavigationService()
        return NavigationUIController(
            rootView: BookingsViewAssembly(navigationService: navigationService).view,
            coordinator: NavigationUICoordinator(navigationService: navigationService)
        )
        .ignoresSafeArea()
    }
    
    
    var tips: some View {
        let navigationService = NavigationService()
        return NavigationUIController(
            rootView: TipsViewAssembly(navigationService: navigationService).view,
            coordinator: NavigationUICoordinator(navigationService: navigationService)
        )
        .ignoresSafeArea()
    }
    
    var settings: some View {
        let navigationService = NavigationService()
        return NavigationUIController(
            rootView: SettingsViewAssembly(navigationService: navigationService).view,
            coordinator: NavigationUICoordinator(navigationService: navigationService)
        )
        .ignoresSafeArea()
    }
}
