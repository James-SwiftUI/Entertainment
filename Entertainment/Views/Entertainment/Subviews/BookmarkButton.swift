import SwiftUI

struct BookmarkButton: View {
    
    let isBookmarked: Bool
    
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(.secondary.opacity(0.6))
                .frame(width: 28, height: 28)
            
            
            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                    .foregroundStyle(.white)
                    .imageScale(.large)
                    .font(.caption)
           
            
            
        }
    }
}

#Preview {
    BookmarkButton(isBookmarked: false)
}
