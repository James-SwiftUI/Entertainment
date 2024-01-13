import SwiftUI

struct ContentView: View {
    
    @State private var activeTab: Tab = .home
    
    var body: some View {
        TabView(selection: $activeTab){
            HomeView()
                .tag(Tab.home)
                .tabItem { Tab.home.tabbedConted }
            
            EntertainmentView()
                .tag(Tab.tv)
                .tabItem { Tab.tv.tabbedConted }
            
            EntertainmentView()
                .tag(Tab.film)
                .tabItem { Tab.film.tabbedConted }
            
            BookmarkView()
                .tag(Tab.bookmark)
                .tabItem { Tab.bookmark.tabbedConted }
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
