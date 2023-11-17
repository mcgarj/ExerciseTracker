import SwiftData
import SwiftUI

@main
struct ExerciseTrackerApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }

}
