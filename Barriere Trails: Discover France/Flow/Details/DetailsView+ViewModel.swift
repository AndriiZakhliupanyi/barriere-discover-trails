import SwiftUI

extension DetailsView {
    
    final class DetailsViewModel: ObservableObject {
        
        let place: Place
        
        var isFavorite: Bool {
            favoriteIds.contains(place.id)
        }
        
        @Published private var favoriteIds: [String]
        
        private let router: DetailsRouter
        
        init(place: Place, router: DetailsRouter) {
            self.place = place
            self.router = router
            self.favoriteIds = Storage.shared.favoriteIds
        }
        
        func openMap() {
            let url = URL(string: "http://maps.apple.com/?daddr=\(place.lat),\(place.long)")!
            UIApplication.shared.open(url)
        }
        
        func changeFavorite() {
            if isFavorite {
                favoriteIds.removeAll { $0 == place.id }
            } else {
                favoriteIds.append(place.id)
            }
            Storage.shared.favoriteIds = favoriteIds
            UtilityService.triggerVibration()
        }
    }
}
