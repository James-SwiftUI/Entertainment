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
                        
                        Picker("Select Mode", selection: $userTheme){
                            ForEach(Theme.allCases, id: \.self){ item in
                                Text(item.rawValue)
                            }
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
    
}

#Preview {
    let preview = PreviewContainer2()
    preview.addExamples(Entertainment.examples)
    return HomeView()
        .modelContainer(preview.container)
}
