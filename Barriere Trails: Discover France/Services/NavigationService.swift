import UIKit
import SwiftUI

final class NavigationService: NSObject {
    
    private weak var navigationController: UINavigationController?
    
    func set(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func push<Content: View>(_ view: Content, animated: Bool = true) {
        navigationController?.pushViewController(makeHostingController(for: view), animated: animated)
    }
    
    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    func dismiss(animated: Bool = true) {
        navigationController?.presentedViewController?.dismiss(animated: animated)
    }
}

private extension NavigationService {

    func makeHostingController<Content: View>(for view: Content) -> HostingController<Content> {
        HostingController(rootView: view)
    }
}
