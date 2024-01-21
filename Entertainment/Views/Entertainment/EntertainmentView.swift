import SwiftUI

struct EntertainmentView: View {
    
    @State private var sortOrder = [SortDescriptor(\Entertainment.title)]
    @State private var userSearchText = ""
    
    let screenCategory: String
    
    var body: some View {
        NavigationStack {
            VStack {
                EntertainmentListView(searchString: userSearchText, sortOrder: sortOrder, entertainmentCat: screenCategory)
                
            }
            .navigationTitle("Entertainment")
                
                .toolbar{
                    Menu("Sort", systemImage: "arrow.up.arrow.down"){
                        Picker("Sort", selection: $sortOrder){
                            Text("Title")
                                .tag([SortDescriptor(\Entertainment.title)])
                            Text("Rating")
                                .tag([SortDescriptor(\Entertainment.rating, order: .reverse)])
                        }
                    }
            }
        }
        .searchable(text: $userSearchText)
    }
}

#Preview {
    let preview = PreviewContainerEntertainment()
    preview.addExamples(Entertainment.examples)
    
    return EntertainmentView(screenCategory: "Movie")
        .modelContainer(preview.container)
}
