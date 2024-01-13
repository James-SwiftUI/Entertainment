import SwiftUI
import SwiftData
struct HomeView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var items: [Entertainment]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(items){ item in
                    VStack {
                        Text(item.title)
                        Image(item.thumbnail)
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
