import Foundation
import MediaPlayer
final class NowPlayingManager {
    private var info: [String: Any] = [:]
    func update(title: String?, artist: String?, album: String?) {
        info[MPMediaItemPropertyTitle] = title ?? "Boom Music"
        info[MPMediaItemPropertyArtist] = artist ?? ""
        info[MPMediaItemPropertyAlbumTitle] = album ?? ""
        info[MPNowPlayingInfoPropertyPlaybackRate] = 1.0
        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
    }
    func updatePlaybackRate(_ rate: Double) {
        info[MPNowPlayingInfoPropertyPlaybackRate] = rate
        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
    }
    func clear() { MPNowPlayingInfoCenter.default().nowPlayingInfo = nil; info.removeAll() }
}
