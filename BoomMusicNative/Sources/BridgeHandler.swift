import Foundation
import UIKit
enum BridgeHandler {
    static func handle(_ body: Any, audioManager: AudioManager) {
        guard let payload = body as? [String: Any], let action = payload["action"] as? String else { return }
        switch action {
        case "play": audioManager.play()
        case "pause": audioManager.pause()
        case "next": audioManager.next()
        case "previous": audioManager.previous()
        case "setNowPlaying":
            audioManager.setNowPlaying(title: payload["title"] as? String, artist: payload["artist"] as? String, album: payload["album"] as? String)
        case "haptic":
            let g = UIImpactFeedbackGenerator(style: .medium); g.prepare(); g.impactOccurred()
        default: break
        }
    }
}
