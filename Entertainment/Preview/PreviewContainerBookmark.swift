import SwiftUI
import SwiftData

struct PreviewContainerBookmark{
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



