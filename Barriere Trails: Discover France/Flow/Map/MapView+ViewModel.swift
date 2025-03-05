import SwiftUI

extension MapView {
    
    final class MapViewModel: ObservableObject {
        
        @Published var items: [Place] = []
        
        private let router: MapRouter
        
        init(router: MapRouter) {
            self.router = router
            self.items = LoadFileService().loadItems(file: .items)
        }
        
        func openDetails(place: Place) {
            router.openDetails(place: place)
        }
    }
}
