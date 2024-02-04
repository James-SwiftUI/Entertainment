import SwiftUI

struct FilmCategoryView: View {
    
    let ratingColor: Color
    let rating: String
    
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(ratingColor)
                .frame(width: 34, height: 34)
            Text(rating)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    FilmCategoryView(ratingColor: .yellow, rating: "PG")
        .previewLayout(.sizeThatFits)
}
