import Foundation
import CoreData

final class DataController {

    static let shared = DataController()

    private let container: NSPersistentContainer

    var viewContext: NSManagedObjectContext {
        container.viewContext
    }

    var newContext: NSManagedObjectContext {
        container.newBackgroundContext()
    }

    private init() {
        var inMemory: Bool = false
        container = NSPersistentContainer(name: "ExerciseTracker")
        #if DEBUG
        if CommandLine.arguments.contains("-ui-testing") {
            inMemory = true
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }

        #endif

        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
