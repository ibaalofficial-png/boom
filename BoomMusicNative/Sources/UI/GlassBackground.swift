import SwiftUI
struct GlassBackground: View {
    @State private var animate = false
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Circle().fill(BoomTheme.purple.opacity(0.28)).frame(width: 360, height: 360).blur(radius: 85)
                .offset(x: animate ? -110 : 100, y: animate ? -260 : -130)
            Circle().fill(BoomTheme.pink.opacity(0.18)).frame(width: 320, height: 320).blur(radius: 95)
                .offset(x: animate ? 130 : -100, y: animate ? 280 : 150)
        }.onAppear {
            withAnimation(.easeInOut(duration: 8).repeatForever(autoreverses: true)) { animate.toggle() }
        }
    }
}
