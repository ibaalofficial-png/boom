import SwiftUI
struct GlassNavigation: View {
    let title: String
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text(title).font(.system(size: 15, weight: .black)).tracking(2.2)
                Text("GLASS EDITION").font(.system(size: 8, weight: .bold)).tracking(1.7).foregroundStyle(BoomTheme.purple)
            }
            Spacer()
            Circle().fill(LinearGradient(colors: [BoomTheme.purple, BoomTheme.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 34, height: 34)
                .overlay(Image(systemName: "waveform").font(.system(size: 14, weight: .bold)).foregroundStyle(.white))
                .shadow(color: BoomTheme.purple.opacity(0.4), radius: 12)
        }.padding(.horizontal, 18).padding(.vertical, 12).background(.ultraThinMaterial)
    }
}
