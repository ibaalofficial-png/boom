import SwiftUI
@main
struct BoomWrapperApp: App {
    @StateObject private var audioManager = AudioManager()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(audioManager).preferredColorScheme(.dark)
        }
    }
}
