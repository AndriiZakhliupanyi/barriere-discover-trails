import SwiftUI

extension TipsView {
    
    final class TipsViewModel: ObservableObject {
        
        @Published var tips: [Tip] = []
        
        private let router: TipsRouter
        
        init(router: TipsRouter) {
            self.router = router
            self.tips = LoadFileService().loadItems(file: .tips)
        }
    }
}
