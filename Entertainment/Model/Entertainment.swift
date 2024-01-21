import SwiftUI
import SwiftData

@Model
class Entertainment: ObservableObject{
    
    var id: String
    var title: String
    var thumbnail: String
    var year: Int
    var category: String
    var rating: String
    var isBookmarked: Bool
    var isTrending: Bool
    
    
    init(id: String, title: String, thumbnail: String, year: Int, category: String, rating: String, isBookmarked: Bool, isTrending: Bool) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.year = year
        self.category = category
        self.rating = rating
        self.isBookmarked = isBookmarked
        self.isTrending = isTrending
    }
    
    
    var ratingColor: Color{
        switch rating{
        case "PG":
               return .yellow
        case "E":
            return .green
        case "18+":
            return .red
        default:
            return .black
        }
    }
    
    
}


extension Entertainment{
    
    static let example = Entertainment(id: "5fa955fd-4818-462b-82d7-811de67d254a", title: "Beyond Earth", thumbnail: "beyond-earth", year: 2019, category: "Movie", rating: "PG", isBookmarked: false, isTrending: true)
    
    static let examples = [
        Entertainment(id: "5fa955fd-4818-462b-82d7-811de67d254a", title: "Beyond Earth", thumbnail: "beyond-earth", year: 2019, category: "Movie", rating: "PG", isBookmarked: false, isTrending: true),
        Entertainment(id: "fa2e8c5e-2163-42a0-8177-8f04daa8e6b3", title: "Bottom Gear", thumbnail: "bottom-gear", year: 2021, category: "Movie", rating: "PG", isBookmarked: false, isTrending: true),
        Entertainment(id: "ccf0f09c-b8b6-49f5-85a2-341d0ce501d6", title: "Undiscovered Cities", thumbnail: "undiscovered-cities", year: 2019, category: "TV Series", rating: "E", isBookmarked: false, isTrending: true),
        Entertainment(id: "93f9c1c0-0ff6-4b69-abb7-3e1568d60e98", title: "1998", thumbnail: "1998", year: 2021, category: "Movie", rating: "18+", isBookmarked: false, isTrending: true)
    ]
}
 
