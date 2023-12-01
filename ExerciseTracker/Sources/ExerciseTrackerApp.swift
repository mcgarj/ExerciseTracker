import SwiftUI

@main
struct ExerciseTrackerApp: App {

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, DataController.shared.viewContext)
        }
    }
}
