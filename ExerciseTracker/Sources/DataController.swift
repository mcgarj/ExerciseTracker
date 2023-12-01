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
        if Thread.current.isRunningXCTest {
            container.persistentStoreDescriptions.first?.url = .init(fileURLWithPath: "/dev/null")
        }

        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

// This checks to make sure it's a unit test running 
extension Thread {
    var isRunningXCTest: Bool {
        for key in self.threadDictionary.allKeys {
            guard let keyAsString = key as? String else {
                continue
            }

            if keyAsString.split(separator: ".").contains("xctest") {
                return true
            }
        }
        return false
    }
}
