import SwiftUI
import WebKit

/// Movie Bar navigation aligned with the homepage (November 2026).
/// Add MovieBarHomeView() to the app's existing root view to enable this navigation.
struct MovieBarHomeView: View {
    private let baseURL = URL(string: "https://www.movie-bar-meckenbeuren.de/")!
    @State private var selected = "Startseite"

    private let sections: [(String, String)] = [
        ("Startseite", ""),
        ("Steckbrief", "steckbrief"),
        ("Wochenprogramm", "wochenprogramm"),
        ("Kalender", "kalender"),
        ("Dart", "dart"),
        ("Reservieren", "reservieren"),
        ("Getränkekarte", "getraenkekarte"),
        ("Jackpots", "jackpots"),
        ("Gästebuch", "gaestebuch"),
        ("Anfahrt", "anfahrt"),
        ("Kontakt", "kontakt"),
        ("Impressum", "impressum")
    ]

    private var destination: URL {
        guard let fragment = sections.first(where: { $0.0 == selected })?.1,
              !fragment.isEmpty else { return baseURL }
        return URL(string: baseURL.absoluteString + "#" + fragment) ?? baseURL
    }

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(sections, id: \.0) { title, _ in
                        Button {
                            selected = title
                        } label: {
                            Text(title)
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(selected == title ? Color(red: 0.57, green: 0.87, blue: 0.63) : .white)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 12)
                                .background(selected == title ? Color(red: 0.09, green: 0.19, blue: 0.13) : .clear)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 12)
            }
            .background(Color(red: 0.03, green: 0.09, blue: 0.05))
            MovieBarWebView(url: destination)
                .id(destination.absoluteString)
        }
    }
}

private struct MovieBarWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.allowsBackForwardNavigationGestures = true
        return view
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        if webView.url != url { webView.load(URLRequest(url: url)) }
    }
}
