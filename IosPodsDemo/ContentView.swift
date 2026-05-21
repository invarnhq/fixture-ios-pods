import SwiftUI
import Alamofire

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "shippingbox")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Invarn fixture: ios-pods")
                .font(.headline)
            Text("If you see this, CocoaPods linked Alamofire cleanly.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

enum Greeter {
    static func greet(_ name: String) -> String {
        _ = Session.default
        return "Hello, \(name)!"
    }
}
