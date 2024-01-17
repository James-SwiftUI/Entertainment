import SwiftUI
import SwiftData

@Model
class Bookmark{
    var id: String
    var title: String
    var thumbnail: String
    var year: Int
    var category: String
    var rating: String
    
    init(id: String = "", title: String = "", thumbnail: String = "", year: Int = 0, category: String = "", rating: String = "") {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.year = year
        self.category = category
        self.rating = rating
    }
}


extension Bookmark{
    static var sampleBookmarkedItems: [Bookmark]{
        [
            Bookmark(id: "2ab4d40c-6c28-42d4-8170-c41950b2cb45",title: "The Great Lands", thumbnail: "the-great-lands", year: 2014, category: "Movie", rating: "18+" ),
            Bookmark(id: "d96adfb1-8fcf-4e7b-981b-cba71957a90d",title: "The Diary", thumbnail: "the-diary", year: 2019, category: "TV Series", rating: "PG" ),
            Bookmark(id: "6da10aee-57c2-4832-b414-804bc3d6a96b", title: "Earth’s Untouched", year: 2017, category: "Movie", rating: "18+")
            
        ]
    }
}



  
 




