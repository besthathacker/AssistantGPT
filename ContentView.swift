import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let htmlFile: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let filePath = Bundle.main.path(forResource: htmlFile, ofType: "html") {
            let fileURL = URL(fileURLWithPath: filePath)
            webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL.deletingLastPathComponent())
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

struct ContentView: View {
    var body: some View {
        WebView(htmlFile: "index")
            .edgesIgnoringSafeArea(.all)
    }
}
