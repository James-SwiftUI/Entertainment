import SwiftUI
import SwiftData
struct HomeView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var items: [Entertainment]
    
    @AppStorage("userTheme") private var userTheme: Theme = .light
    
    var filterTrending: [Entertainment]{
            return items.filter { $0.isTrending == true}
        }
    
    var body: some View {
        NavigationStack{
            VStack{
                TrendingView(images: filterTrending)
                List{
                    ForEach(items){ item in
                        VStack {
                            Text(item.title)
                            Image(item.thumbnail)
                        }
                    }
                }
                
            }
            .preferredColorScheme(userTheme.colorScheme)
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    Menu{
                        
                        Button{
                            setTheme(.systemDefault)
                        }label: {
                            Label("Default", systemImage: "person.2.badge.gearshape")
                        }
                        
                        Button{
                            setTheme(.light)
                        }label: {
                            Label("Light", systemImage: "sun.max")
                        }
                        
                        Button{
                            setTheme(.dark)
                        }label: {
                            Label("Dark", systemImage: "moon")
                        }
                    }label: {
                        Label("Display", systemImage: "slider.horizontal.below.sun.max")
                            .imageScale(.large)
                    }
                    
                }
            }
            .navigationTitle("Home")
        }
    }
    
    func setTheme(_ theme: Theme){
        userTheme = theme
    }
}

#Preview {
    HomeView()
}
