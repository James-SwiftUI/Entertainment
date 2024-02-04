import SwiftUI

struct EntertainmentIcon: View {
    
    let picture: String
    
    var body: some View {
        HStack{
            Image(systemName: picture == "TV Series" ? "tv.circle" : "film.circle")
                .font(.title3)
                .foregroundStyle(.primary)
           
        }
        .foregroundStyle(.secondary)
        .fontWeight(.semibold)
        .font(.caption)
    }
}

#Preview {
    EntertainmentIcon(picture: "Movie")
}
