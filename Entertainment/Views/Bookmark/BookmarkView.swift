import SwiftUI
import SwiftData

struct BookmarkView: View {
    
    @Query private var items: [Bookmark]
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
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
    
    let preview = PreviewContainer()
    preview.addExamples(Bookmark.sampleBookmarkedItems)
    
    return BookmarkView()
        .modelContainer(preview.container)
}
