import SwiftUI
import SwiftData

struct EntertainmentListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Entertainment]
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Entertainment>] = [], entertainmentCat: String){
        
        _items = Query(filter: #Predicate{ item in
            if searchString.isEmpty{
                item.category == entertainmentCat
            }else{
                (item.title.localizedStandardContains(searchString)
                && item.category == entertainmentCat)
                || item.rating.localizedStandardContains(searchString)
                
               
            }
            
        }, sort: sortOrder)
        
    }
    
    var body: some View {
        NavigationStack{
            List(items){ item in
                VStack(alignment: .leading){
                    EntertainmentRowView(item: item)
                }
                
            }
        }
    }
}

#Preview {
    EntertainmentListView(entertainmentCat: "Movie")
        .modelContainer(for: Entertainment.self)
}
