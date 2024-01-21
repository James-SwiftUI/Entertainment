import Foundation
import SwiftData

struct PreviewContainerEntertainment{
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
