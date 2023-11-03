import SwiftData
import SwiftUI

@main
struct ExerciseTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Exercise.self)
    }
}
