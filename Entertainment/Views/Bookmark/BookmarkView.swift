import SwiftUI
import SwiftData

struct BookmarkView: View {
    
    @Query private var items: [Bookmark]
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            Group{
                if !items.isEmpty{
                    List{
                        ForEach(items){ item in
                            VStack(alignment: .leading){
                                Text(item.title)
                            }
                            .swipeActions{
                                Button(role: .destructive){
                                    context.delete(item)
                                }label: {
                                    Label("Delete", systemImage: "trash")
                                        .symbolVariant(.fill)
                                }
                            }
                        }
                        
                    }
                }else{
                    ContentUnavailableView("You no bookmarks",systemImage: "bookmark.slash", description: Text("Add a TV Series or Movie to your bookmark list"))
                }
            }
            .navigationTitle("Bookmarks")
            .toolbar{
                ToolbarItem{
                    Button{
                        let item = Bookmark(id: "ABC123", title: "New Film", rating: "18+")
                        context.insert(item)
                    }label: {
                        Label("Add", systemImage: "plus.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    
    let preview = PreviewContainerBookmark()
    preview.addExamples(Bookmark.sampleBookmarkedItems)
    
    return BookmarkView()
        .modelContainer(preview.container)
}
