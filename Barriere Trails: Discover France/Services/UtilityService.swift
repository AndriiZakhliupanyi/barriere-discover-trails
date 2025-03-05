import UIKit
import Foundation

final class UtilityService {
    
    static func triggerVibration() {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(.success)
    }
}
