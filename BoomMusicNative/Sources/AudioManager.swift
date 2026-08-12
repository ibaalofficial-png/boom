import Foundation
import AVFoundation
import MediaPlayer

final class AudioManager: ObservableObject {
    private let nowPlaying = NowPlayingManager()
    init() { configureAudioSession(); configureRemoteCommands() }

    private func configureAudioSession() {
        do {
            let s = AVAudioSession.sharedInstance()
            try s.setCategory(.playback, mode: .default, options: [.allowAirPlay, .allowBluetoothA2DP])
            try s.setActive(true)
        } catch { print("[BoomNative] Audio session:", error) }
    }

    private func configureRemoteCommands() {
        let c = MPRemoteCommandCenter.shared()
        c.playCommand.addTarget { _ in NotificationCenter.default.post(name: .boomNativeRemotePlay, object: nil); return .success }
        c.pauseCommand.addTarget { _ in NotificationCenter.default.post(name: .boomNativeRemotePause, object: nil); return .success }
        c.nextTrackCommand.addTarget { _ in NotificationCenter.default.post(name: .boomNativeRemoteNext, object: nil); return .success }
        c.previousTrackCommand.addTarget { _ in NotificationCenter.default.post(name: .boomNativeRemotePrevious, object: nil); return .success }
    }

    func play() { NotificationCenter.default.post(name: .boomNativeRemotePlay, object: nil) }
    func pause() { NotificationCenter.default.post(name: .boomNativeRemotePause, object: nil) }
    func next() { NotificationCenter.default.post(name: .boomNativeRemoteNext, object: nil) }
    func previous() { NotificationCenter.default.post(name: .boomNativeRemotePrevious, object: nil) }
    func setNowPlaying(title: String?, artist: String?, album: String?) { nowPlaying.update(title: title, artist: artist, album: album) }
}
extension Notification.Name {
    static let boomNativeRemotePlay = Notification.Name("BoomNativeRemotePlay")
    static let boomNativeRemotePause = Notification.Name("BoomNativeRemotePause")
    static let boomNativeRemoteNext = Notification.Name("BoomNativeRemoteNext")
    static let boomNativeRemotePrevious = Notification.Name("BoomNativeRemotePrevious")
}
