import SwiftUI
import SwiftData

@main
struct EntertainmentApp: App {
    
    @AppStorage("firtTimeLaunch") private var firstTimeLaunch: Bool = true
    
    var body: some Scene {
        WindowGroup {
            TabbedView()
        }
        .modelContainer(EntertainmentContainer.create(createDefaults: &firstTimeLaunch))
        
        
    }
}
