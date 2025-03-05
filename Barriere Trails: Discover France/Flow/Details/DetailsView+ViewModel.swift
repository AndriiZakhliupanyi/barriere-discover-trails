import SwiftUI

extension DetailsView {
    
    final class DetailsViewModel: ObservableObject {
        
        let place: Place
        
        private let router: DetailsRouter
        
        init(place: Place, router: DetailsRouter) {
            self.place = place
            self.router = router
        }
        
        func openMap() {
            let url = URL(string: "http://maps.apple.com/?daddr=\(place.lat),\(place.long)")!
            UIApplication.shared.open(url)
        }
    }
}
