import SwiftUI

struct BookmarkView: View {
    var body: some View {
        NavigationStack {
            List{
                Text("TV SHOW")
                Text("FILM")
            }
            .navigationTitle("Bookmarks")
        }
    }
}

#Preview {
    BookmarkView()
}
