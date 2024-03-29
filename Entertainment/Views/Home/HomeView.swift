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
                        HomeRowView(item: item)
                    }
                }.listStyle(.plain)
                
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
    let preview = PreviewContainerEntertainment()
    preview.addExamples(Entertainment.examples)
    return HomeView()
        .modelContainer(preview.container)
}
