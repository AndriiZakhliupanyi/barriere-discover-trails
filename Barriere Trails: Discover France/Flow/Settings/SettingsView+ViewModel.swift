import SwiftUI

extension SettingsView {
    
    final class SettingsViewModel: ObservableObject {
        
        private let router: SettingsRouter
        
        @Published var isPlaying: Bool
        
        init(router: SettingsRouter) {
            self.router = router
            self.isPlaying = SoundService.shared.isPlaying
        }
        
        func changeSound() {
            SoundService.shared.changePlay()
            isPlaying = SoundService.shared.isPlaying
        }
        
        func openAboutUs() {
            router.openAboutUs()
        }
        
        func clearCache() {
            Storage.shared.favoriteIds = []
            UtilityService.triggerVibration()
        }
    }
}
