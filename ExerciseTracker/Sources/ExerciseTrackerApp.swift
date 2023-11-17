import SwiftData
import SwiftUI

@main
struct ExerciseTrackerApp: App {
    let modelContainer: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(modelContainer)
    }
    
    init() {
        var inMemory = false
        
        #if DEBUG
        if CommandLine.arguments.contains("enable-testing") {
            inMemory = true
        }
        #endif
        
        do {
            let configuration = ModelConfiguration(for: Exercise.self, isStoredInMemoryOnly: inMemory)
            modelContainer = try ModelContainer(for: Exercise.self, configurations: configuration)
        } catch {
            fatalError("Failed to load model container")
        }
    }
}
