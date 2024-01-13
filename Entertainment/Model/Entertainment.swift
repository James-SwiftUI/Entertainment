import Foundation
import SwiftData

@Model
class Entertainment{
    
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
    
    
//    static let example = Entertainment(id: "5fa955fd-4818-462b-82d7-811de67d254a", title: "Beyond Earth", thumbnail: "beyond-earth", year: 2019, category: "Movie", rating: "PG", isBookmarked: false, isTrending: true)
}
