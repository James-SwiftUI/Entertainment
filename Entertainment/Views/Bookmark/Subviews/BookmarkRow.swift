import SwiftUI

struct BookmarkRow: View {
    
    let item: Bookmark
    
    var body: some View {
        VStack{
                    Image(item.thumbnail)
                .resizable()
                .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                    VStack(alignment: .center){
                        Text(item.title)
                            .fontWeight(.semibold)
                    
                        HStack{
                            Spacer()
                            EntertainmentIcon(picture: item.category)
                                .foregroundColor(.accentColor)
                                
                            
                            Text(String(item.year))
                            Image(systemName: "rosette")
                                .foregroundColor(.yellow)
                            Spacer()
                        }
                        .font(.headline)
                        
                    }.font(.title)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 220)
        
    }
}

#Preview {
    BookmarkRow(item: Bookmark.sampleBookmarkedItems[0])
}
