import Foundation
import SwiftData

actor EntertainmentContainer{
    
    @MainActor
    static func create(createDefaults: inout Bool)-> ModelContainer{
        let schema = Schema([Entertainment.self])
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: configuration)
        
        
        if createDefaults{
            createDefaults = false
            let allEntertainment = EntertainmentJSONDecoder.decode(fileName: "data")
            
            if allEntertainment.isEmpty == false{
                allEntertainment.forEach{ item in
                    let entertainment = Entertainment(id: item.id, title: item.title, thumbnail: item.thumbnail, year: item.year, category: item.category, rating: item.rating, isBookmarked: item.isBookmarked, isTrending: item.isTrending)
                    container.mainContext.insert(entertainment)
                }
            }
        }
        
        
        
        return container
        
    }
    
}

