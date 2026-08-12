import SwiftUI
struct ContentView: View {
    @EnvironmentObject var audioManager: AudioManager
    var body: some View {
        ZStack {
            GlassBackground()
            VStack(spacing: 0) {
                GlassNavigation(title: "BOOM MUSIC")
                WebView(audioManager: audioManager)
                    .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
            }
        }.preferredColorScheme(.dark)
    }
}
