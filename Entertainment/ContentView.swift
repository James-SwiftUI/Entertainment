import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "tv.inset.filled")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Entertainment App")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
