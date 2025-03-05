import UIKit
import SwiftUI

struct NavigationUIController<T: View>: UIViewControllerRepresentable {
    
    var rootView: T
    let coordinator: NavigationUICoordinator
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let hostingController = HostingController(rootView: rootView)
        let navigationController = UINavigationController(rootViewController: hostingController)
        context.coordinator.set(navigationController)
        
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
    
    func makeCoordinator() -> NavigationUICoordinator {
        return coordinator
    }
}

final class NavigationUICoordinator: NSObject {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    fileprivate func set(_ navigationController: UINavigationController) {
        navigationService.set(navigationController: navigationController)
    }
}

class HostingController<Content: View>: UIHostingController<Content> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        view.clipsToBounds = true
        view.backgroundColor = .background
        
        if let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.background
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor.accent,
                .font: FontModel.title.font
            ]
            
            navigationBar.tintColor = .accent
//            navigationBar.titleTextAttributes = [.font: FontModel.text.font]

            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
        }
    }

}
