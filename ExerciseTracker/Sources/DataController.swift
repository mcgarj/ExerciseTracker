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
        container = NSPersistentContainer(name: "ExerciseTracker")
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
