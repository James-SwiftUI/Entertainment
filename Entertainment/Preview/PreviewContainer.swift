import Foundation
import SwiftData

struct PreviewContainer{
    let container: ModelContainer
    init() {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        do{
            container = try ModelContainer(for: Bookmark.self, configurations: configuration)
        }catch{
            fatalError("Cannot create a preview container")
        }
    }
    
    
    func addExamples(_ examples: [Bookmark]){
        Task{ @MainActor in
            examples.forEach { example in
                container.mainContext.insert(example)
            }
        }
    }
    
}


struct PreviewContainer2{
    let container: ModelContainer
    init() {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        do{
            container = try ModelContainer(for: Entertainment.self, configurations: configuration)
        }catch{
            fatalError("Cannot create a preview container")
        }
    }
    
    
    func addExamples(_ examples: [Entertainment]){
        Task{ @MainActor in
            examples.forEach { example in
                container.mainContext.insert(example)
            }
        }
    }
    
}
