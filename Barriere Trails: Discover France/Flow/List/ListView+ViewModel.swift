import SwiftUI

extension ListView {
    
    final class ListViewModel: ObservableObject {
        
        @Published var items: [Place] = []
        @Published var filterCurrentItem: String {
            didSet {
                reloadItems()
            }
        }
        let filterItems: [String]
        
        private let allItems: [Place]
        
        private var favoriteIds: [String] {
            didSet {
                reloadItems()
            }
        }
        
        private let router: ListRouter
        
        init(router: ListRouter) {
            self.router = router
            self.allItems = LoadFileService().loadItems(file: .items)
            self.favoriteIds = Storage.shared.favoriteIds
            self.filterItems = ["All", "Favorites"]
            self.filterCurrentItem = "All"
            self.reloadItems()
        }
        
        func openDetails(place: Place) {
            router.openDetails(place: place)
        }
        
        func reloadFavoriteIds() {
            favoriteIds = Storage.shared.favoriteIds
        }
        
        func reloadItems() {
            if filterCurrentItem == filterItems.first {
                items = allItems
            } else {
                items = allItems.filter { favoriteIds.contains($0.id) }
            }
        }
    }
}
