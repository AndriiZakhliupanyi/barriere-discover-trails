import SwiftUI

extension AboutUsView {
    
    final class AboutUsViewModel: ObservableObject {
        
        private let router: AboutUsRouter
        
        init(router: AboutUsRouter) {
            self.router = router
        }
    }
}
