

import SwiftUI

struct EntertainmentRowView: View {
    
    let item: Entertainment
    
    var body: some View {
        HStack{
                        VStack(alignment: .leading){
                            ZStack(alignment: .topTrailing){
                                Image(item.thumbnail)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                
                                BookmarkButton(isBookmarked: item.isBookmarked)
                                    .padding(8)
                                    .onTapGesture {
                                        
                                    }
                            }
                        }
                   
                    VStack(alignment: .leading, spacing: 10){
                        HStack{
                            Text(String(item.year))
                            EntertainmentIcon(picture: item.category)
                        }
                        Text(item.title)
                            .fontWeight(.bold)
                    }
            }
    }
}

#Preview {
    let preview = PreviewContainer2()
    preview.addExamples(Entertainment.examples)
    return EntertainmentRowView(item: Entertainment.example)
        .modelContainer(preview.container)
}

