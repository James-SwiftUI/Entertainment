import SwiftUI
import SwiftData

@main
struct EntertainmentApp: App {
    
    @AppStorage("firtTimeLaunch") private var firstTimeLaunch: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(EntertainmentContainer.create(createDefaults: &firstTimeLaunch))
        
    }
}
