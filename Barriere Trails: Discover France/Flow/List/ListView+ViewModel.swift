import SwiftUI

extension ListView {
    
    final class ListViewModel: ObservableObject {
        
        @Published var items: [Place] = []
        
        private let router: ListRouter
        
        init(router: ListRouter) {
            self.router = router
            self.items = LoadFileService().loadItems()
        }
        
        func openDetails(place: Place) {
            router.openDetails(place: place)
        }
    }
}
