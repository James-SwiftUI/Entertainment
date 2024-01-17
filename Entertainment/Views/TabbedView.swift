import SwiftUI

struct TabbedView: View {
    
    @State private var activeTab: Tab = .home
    
    var body: some View {
        TabView(selection: $activeTab){
            HomeView()
                .tag(Tab.home)
                .tabItem { Tab.home.tabbedContent }
            
            EntertainmentView(screenCategory: "TV Series")
                .tag(Tab.tv)
                .tabItem { Tab.tv.tabbedContent }
            
            EntertainmentView(screenCategory: "Movie")
                .tag(Tab.film)
                .tabItem { Tab.film.tabbedContent }
            
            BookmarkView()
                .tag(Tab.bookmark)
                .tabItem { Tab.bookmark.tabbedContent }
        }
        .tint(.red)
        
    }
}

#Preview {
   
    TabbedView()
        
}
