import SwiftUI
import SwiftData

struct HomeRowView: View {

    @ObservedObject var item: Entertainment
    @Query private var items: [Bookmark]
    @Query private var pictures: [Entertainment]
    @Environment(\.modelContext) var context


    var body: some View {
            HStack{
                        VStack(alignment: .leading){
                            ZStack(alignment: .topTrailing){
                                Image(item.thumbnail)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))

                                Button{
                                    addRemoveBookmark(item: item)
                                }label: {
                                    ZStack{
                                        Circle()
                                            .foregroundColor(.white.opacity(0.6))
                                            .frame(width: 26, height: 26)
                                        Image(systemName: item.isBookmarked ? "bookmark.fill" : "bookmark")
                                                .foregroundStyle(.white)
                                                .imageScale(.large)
                                                .font(.caption)
                                    }
                                }
                                .buttonStyle(.plain)


                                    .padding(8)
                            }
                        }
                    VStack(alignment: .leading, spacing: 10){
                        HStack{
                            Text(String(item.year))
                            EntertainmentIcon(picture: item.category)
                        }
                        Text(item.title)
                                .fontWeight(.bold)
                        FilmCategoryView(ratingColor: item.ratingColor, rating: item.rating)
                    }
            }
    }

    func addRemoveBookmark(item: Entertainment) {
        guard let itemIndex = pictures.firstIndex(where: { $0.id == item.id }) else { return }

        pictures[itemIndex].isBookmarked.toggle()

        if pictures[itemIndex].isBookmarked {
            let bookmark = Bookmark(id: item.id, title: item.title, thumbnail: item.thumbnail, year: item.year, category: item.category, rating: item.rating)
            context.insert(bookmark)
        } else {
            if let bookmarkID = items.firstIndex(where: { $0.id == item.id }) {
                context.delete(items[bookmarkID])
            }
        }
    }
}

#Preview {
    let preview = PreviewContainerEntertainment()
    preview.addExamples(Entertainment.examples)
    return EntertainmentRowView(item: Entertainment.example)
        .modelContainer(preview.container)
}

