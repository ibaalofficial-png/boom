import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let audioManager: AudioManager
    func makeCoordinator() -> Coordinator { Coordinator(audioManager: audioManager) }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let controller = WKUserContentController()
        controller.add(context.coordinator, name: "boomNative")
        config.userContentController = controller
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.backgroundColor = .clear
        webView.isOpaque = false
        webView.scrollView.backgroundColor = .clear
        webView.navigationDelegate = context.coordinator
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
        return webView
    }
    func updateUIView(_ webView: WKWebView, context: Context) {}

    final class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        let audioManager: AudioManager
        init(audioManager: AudioManager) { self.audioManager = audioManager }
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            guard message.name == "boomNative" else { return }
            BridgeHandler.handle(message.body, audioManager: audioManager)
        }
    }
}
