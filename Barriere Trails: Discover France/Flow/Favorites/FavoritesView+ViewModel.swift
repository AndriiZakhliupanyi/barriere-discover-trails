import SwiftUI

extension FavoritesView {
    
    final class FavoritesViewModel: ObservableObject {
        
        @Published var items: [Place] = []
        
        private var favoriteIds: [String] {
            didSet {
                reloadItems()
            }
        }
        
        private let allItems: [Place]
        private let router: FavoritesRouter
        
        init(router: FavoritesRouter) {
            self.router = router
            self.allItems = LoadFileService().loadItems(file: .items)
            self.favoriteIds = Storage.shared.favoriteIds
            self.reloadItems()
        }
        
        func reloadFavoriteIds() {
            favoriteIds = Storage.shared.favoriteIds
        }
        
        func reloadItems() {
            items = allItems.filter { favoriteIds.contains($0.id) }
        }
        
        func openDetails(place: Place) {
            router.openDetails(place: place)
        }
    }
}
