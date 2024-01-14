import SwiftUI

enum Tab: String{
    case home = "Home"
    case tv = "TV"
    case film = "Film"
    case bookmark = "Bookmark"
    
    @ViewBuilder
    var tabbedContent: some View{
        switch self{
        case .home:
            Image(systemName: "house")
            Text(self.rawValue)
        case .tv:
            Image(systemName: "tv")
            Text(self.rawValue)
        case .film:
            Image(systemName: "film")
            Text(self.rawValue)
        case .bookmark:
            Image(systemName: "bookmark")
            Text(self.rawValue)
        }
    }
    
    
}
