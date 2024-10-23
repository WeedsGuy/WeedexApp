import SwiftUI
import WebKit

// A custom WebView to display embedded Spotify videos
struct SpotifyVideoPlayer: UIViewRepresentable {
    let videoURL: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: videoURL)
        uiView.load(request)
    }
}

struct SpotifyVideoListView: View {
    let spotifyVideoURLs = [
        URL(string: "https://open.spotify.com/episode/4c11LTStgmKMYSnjDtQbKb?si=gmVZ49qRTfyVFCa73ajS_A")!,
        URL(string: "https://open.spotify.com/embed/episode/another-video-url")!,
        
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(spotifyVideoURLs, id: \.self) { videoURL in
                    SpotifyVideoPlayer(videoURL: videoURL)
                        .frame(width: 624, height: 351)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}
