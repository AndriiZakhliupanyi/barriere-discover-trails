import SwiftUI
import AVFoundation
import AVFAudio
import MediaPlayer

final class SoundService {
    
    static let shared = SoundService()
    private var player: AVAudioPlayer?
    private var session = AVAudioSession.sharedInstance()
    
    private init() {}
    
    var isPlaying: Bool {
        player?.isPlaying ?? false
    }
    
    func startAudio() {
        try? session.setCategory(.playback, mode: .default, options: [])
        try? session.setActive(true, options: .notifyOthersOnDeactivation)
        try? session.overrideOutputAudioPort(.speaker)
        guard let sound = Bundle.main.path(forResource: "sound", ofType: "mp3") else {
            return
        }
        player = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
        player?.numberOfLoops = -1
        player?.play()
        setVolume()
    }
    
    func changePlay() {
        if isPlaying {
            player?.pause()
        } else {
            player?.play()
        }
        setVolume()
    }
    
    private func setVolume() {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = !self.isPlaying ? 0.0 : 0.5
        }
    }
}
