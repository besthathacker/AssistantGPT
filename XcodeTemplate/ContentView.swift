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
    @State private var isLoading = true

    var body: some View {
        ZStack {
            WebView(htmlFile: "index")
                .opacity(isLoading ? 0 : 1)
                .onAppear {
                    // Simulate a loading delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isLoading = false
                        }
                    }
                }

            if isLoading {
                VStack {
                    Text("AssistantGPT")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(1.5)
                }
                .transition(.opacity)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
