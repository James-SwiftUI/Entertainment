import SwiftUI

enum Picture: String{
    
    case film = "Movie"
    case tv = "TV Series"
    
    @ViewBuilder
    var iconImage: some View{
        switch self{
        case .film:
            Image(systemName: "film.fill")
                .imageScale(.large)
                .symbolVariant(.square)
        
        case .tv:
            Image(systemName: "tv.inset.filled")
                .imageScale(.large)
                .symbolVariant(.fill.slash)
                
        }
    }
}
